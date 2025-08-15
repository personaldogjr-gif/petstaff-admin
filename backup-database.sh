#!/bin/bash

echo "💾 BACKUP DO BANCO DE DADOS LOCAL"
echo "=================================="

# Configurações
DB_NAME="petstaff_local"
DB_USER="root"
DB_PASSWORD="root"
BACKUP_DIR="backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/gopet_local_backup_${TIMESTAMP}.sql"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}📋 PASSO 1: Criando diretório de backup...${NC}"

# Criar diretório de backup se não existir
mkdir -p ${BACKUP_DIR}

echo -e "${YELLOW}📋 PASSO 2: Fazendo backup do banco...${NC}"

# Fazer backup do banco
mysqldump -u${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > ${BACKUP_FILE}

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Backup criado com sucesso: ${BACKUP_FILE}${NC}"
    
    # Mostrar tamanho do arquivo
    FILE_SIZE=$(du -h ${BACKUP_FILE} | cut -f1)
    echo -e "${GREEN}📊 Tamanho do backup: ${FILE_SIZE}${NC}"
    
    # Listar backups existentes
    echo -e "${YELLOW}📋 Backups disponíveis:${NC}"
    ls -lh ${BACKUP_DIR}/*.sql | tail -5
else
    echo -e "${RED}❌ Erro ao criar backup${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 BACKUP CONCLUÍDO!${NC}"
echo -e "${YELLOW}💡 Use este arquivo para restaurar o banco na AWS se necessário${NC}"
