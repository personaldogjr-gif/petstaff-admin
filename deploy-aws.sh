#!/bin/bash

echo "🚀 DEPLOY GO PET PARA AWS - SEM DOCKER"
echo "========================================"

# Configurações
APP_NAME="gopet"
AWS_REGION="us-east-1"
EC2_INSTANCE_IP="ec2-52-73-84-51.compute-1.amazonaws.com"
EC2_USER="ubuntu"
EC2_KEY_PATH="PetStaff.pem"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}📋 PASSO 1: Preparando aplicação local...${NC}"

# Limpar caches
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear

# Otimizar para produção
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Instalar dependências de produção
composer install --optimize-autoloader --no-dev

# Compilar assets (se houver)
if [ -f "package.json" ]; then
    npm install --production
    npm run build
fi

echo -e "${GREEN}✅ Aplicação local preparada!${NC}"

echo -e "${YELLOW}📋 PASSO 2: Criando arquivo de deploy...${NC}"

# Criar arquivo de deploy
tar --exclude='.git' --exclude='node_modules' --exclude='storage/logs/*' --exclude='storage/framework/cache/*' --exclude='storage/framework/sessions/*' --exclude='storage/framework/views/*' --exclude='.env' --exclude='.env.local' --exclude='.env.backup*' --exclude='BACKUP-*' --exclude='cookies*.txt' --exclude='backups/' -czf "${APP_NAME}-deploy.tar.gz" .

echo -e "${GREEN}✅ Arquivo de deploy criado: ${APP_NAME}-deploy.tar.gz${NC}"

echo -e "${YELLOW}📋 PASSO 3: Enviando para servidor AWS...${NC}"

# Enviar para servidor AWS
scp -i ${EC2_KEY_PATH} "${APP_NAME}-deploy.tar.gz" ${EC2_USER}@${EC2_INSTANCE_IP}:~/

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Arquivo enviado para AWS!${NC}"
else
    echo -e "${RED}❌ Erro ao enviar arquivo para AWS${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 PASSO 4: Executando deploy no servidor...${NC}"

# Executar deploy no servidor
ssh -i ${EC2_KEY_PATH} ${EC2_USER}@${EC2_INSTANCE_IP} << 'EOF'
    echo "🔄 Iniciando deploy no servidor..."
    
    # Parar aplicação atual
    sudo systemctl stop nginx
    sudo systemctl stop php8.1-fpm
    
    # Backup da versão atual
    if [ -d "/var/www/${APP_NAME}" ]; then
        sudo mv /var/www/${APP_NAME} /var/www/${APP_NAME}-backup-$(date +%Y%m%d-%H%M%S)
    fi
    
    # Extrair nova versão
    sudo mkdir -p /var/www/${APP_NAME}
    sudo tar -xzf ~/${APP_NAME}-deploy.tar.gz -C /var/www/${APP_NAME}
    
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
    
    # Limpar caches
    php artisan config:clear
    php artisan cache:clear
    php artisan view:clear
    php artisan route:clear
    
    # Otimizar para produção
    php artisan config:cache
    php artisan route:cache
    php artisan view:cache
    
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

echo -e "${YELLOW}📋 PASSO 5: Limpeza local...${NC}"

# Limpar arquivo de deploy local
rm "${APP_NAME}-deploy.tar.gz"

echo -e "${GREEN}🎉 DEPLOY CONCLUÍDO COM SUCESSO!${NC}"
echo -e "${YELLOW}🌐 Acesse: https://faculdog.com.br${NC}"
echo -e "${YELLOW}📧 Verifique os logs em caso de problemas${NC}"
