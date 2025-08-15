#!/bin/bash

echo "🚀 DEPLOY GO PET PARA AWS - VERSÃO SIMPLIFICADA"
echo "================================================="

# Configurações
APP_NAME="gopet"
EC2_INSTANCE_IP="ec2-52-73-84-51.compute-1.amazonaws.com"
EC2_USER="ubuntu"
EC2_KEY_PATH="PetStaff.pem"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}📋 PASSO 1: Verificando arquivo de deploy...${NC}"

if [ ! -f "gopet-deploy-working.tar.gz" ]; then
    echo -e "${RED}❌ Arquivo gopet-deploy-working.tar.gz não encontrado!${NC}"
    echo -e "${YELLOW}💡 Execute primeiro: tar --exclude='.git' --exclude='node_modules' --exclude='storage/logs/*' --exclude='storage/framework/cache/*' --exclude='storage/framework/sessions/*' --exclude='storage/framework/views/*' --exclude='.env' --exclude='.env.local' --exclude='.env.backup*' --exclude='BACKUP-*' --exclude='cookies*.txt' --exclude='backups/' --exclude='bootstrap/cache/*' -czf gopet-deploy-working.tar.gz .${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Arquivo de deploy encontrado: gopet-deploy-working.tar.gz${NC}"

echo -e "${YELLOW}📋 PASSO 2: Enviando para servidor AWS...${NC}"

# Enviar para servidor AWS
scp -i ${EC2_KEY_PATH} "gopet-deploy-working.tar.gz" ${EC2_USER}@${EC2_INSTANCE_IP}:~/

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Arquivo enviado para AWS!${NC}"
else
    echo -e "${RED}❌ Erro ao enviar arquivo para AWS${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 PASSO 3: Executando deploy no servidor...${NC}"

# Executar deploy no servidor
ssh -i ${EC2_KEY_PATH} ${EC2_USER}@${EC2_INSTANCE_IP} << 'EOF'
    echo "🔄 Iniciando deploy no servidor..."
    
    # Parar aplicação atual
    sudo systemctl stop nginx 2>/dev/null || true
    sudo systemctl stop php8.1-fpm 2>/dev/null || true
    
    # Backup da versão atual
    if [ -d "/var/www/${APP_NAME}" ]; then
        sudo mv /var/www/${APP_NAME} /var/www/${APP_NAME}-backup-$(date +%Y%m%d-%H%M%S)
        echo "✅ Backup da versão atual criado"
    fi
    
    # Extrair nova versão
    sudo mkdir -p /var/www/${APP_NAME}
    sudo tar -xzf ~/gopet-deploy-working.tar.gz -C /var/www/${APP_NAME}
    
    # Configurar permissões
    sudo chown -R www-data:www-data /var/www/${APP_NAME}
    sudo chmod -R 755 /var/www/${APP_NAME}
    sudo chmod -R 775 /var/www/${APP_NAME}/storage
    sudo chmod -R 775 /var/www/${APP_NAME}/bootstrap/cache
    
    # Copiar arquivo de ambiente
    sudo cp /var/www/${APP_NAME}/env.production /var/www/${APP_NAME}/.env
    
    # Instalar dependências
    cd /var/www/${APP_NAME}
    composer install --optimize-autoloader --no-dev
    
    # Executar migrações
    php artisan migrate --force
    
    # Limpar caches (sem otimizar)
    php artisan config:clear
    php artisan cache:clear
    php artisan view:clear
    php artisan route:clear
    
    # Reiniciar serviços
    sudo systemctl start php8.1-fpm
    sudo systemctl start nginx
    
    echo "✅ Deploy concluído!"
EOF

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Deploy executado com sucesso!${NC}"
else
    echo -e "${RED}❌ Erro durante deploy no servidor${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 PASSO 4: Limpeza local...${NC}"

# Limpar arquivo de deploy local
rm "gopet-deploy-working.tar.gz"

echo -e "${GREEN}🎉 DEPLOY CONCLUÍDO COM SUCESSO!${NC}"
echo -e "${YELLOW}🌐 Acesse: https://faculdog.com.br${NC}"
echo -e "${YELLOW}📧 Verifique os logs em caso de problemas${NC}"
