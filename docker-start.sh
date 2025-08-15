#!/bin/bash

echo "🐳 Iniciando Pet Staff no Docker..."
echo "=================================="

# Verificar se o Docker está rodando
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker não está rodando. Inicie o Docker Desktop primeiro."
    exit 1
fi

# Parar containers existentes
echo "🛑 Parando containers existentes..."
docker-compose -f docker-compose.local.yml down

# Remover containers antigos
echo "🧹 Removendo containers antigos..."
docker-compose -f docker-compose.local.yml rm -f

# Construir e iniciar containers
echo "🔨 Construindo e iniciando containers..."
docker-compose -f docker-compose.local.yml up --build -d

# Aguardar containers iniciarem
echo "⏳ Aguardando containers iniciarem..."
sleep 10

# Verificar status dos containers
echo "📊 Status dos containers:"
docker-compose -f docker-compose.local.yml ps

# Gerar chave da aplicação
echo "🔑 Gerando chave da aplicação..."
docker-compose -f docker-compose.local.yml exec app php artisan key:generate

# Executar migrações
echo "🗄️ Executando migrações..."
docker-compose -f docker-compose.local.yml exec app php artisan migrate:fresh --seed

# Criar link simbólico do storage
echo "🔗 Criando link simbólico do storage..."
docker-compose -f docker-compose.local.yml exec app php artisan storage:link

# Limpar cache
echo "🧹 Limpando cache..."
docker-compose -f docker-compose.local.yml exec app php artisan config:clear
docker-compose -f docker-compose.local.yml exec app php artisan cache:clear
docker-compose -f docker-compose.local.yml exec app php artisan view:clear

echo ""
echo "✅ Pet Staff iniciado com sucesso no Docker!"
echo ""
echo "🌐 URLs de acesso:"
echo "   - Aplicação: http://localhost:8080"
echo "   - PHPMyAdmin: http://localhost:8081"
echo ""
echo "🔑 Credenciais padrão:"
echo "   - MySQL: petstaff / petstaff123"
echo "   - Root: root / root"
echo ""
echo "📝 Comandos úteis:"
echo "   - Ver logs: docker-compose -f docker-compose.local.yml logs -f"
echo "   - Parar: docker-compose -f docker-compose.local.yml down"
echo "   - Reiniciar: docker-compose -f docker-compose.local.yml restart"
echo ""
echo "🚀 Acesse http://localhost:8080 para começar!" 