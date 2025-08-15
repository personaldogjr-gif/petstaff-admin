# 🚀 CONFIGURAÇÃO DO SERVIDOR AWS PARA GO PET

## 📋 PRÉ-REQUISITOS

- **EC2 Instance**: Ubuntu 20.04 LTS ou superior
- **Security Groups**: Portas 22 (SSH), 80 (HTTP), 443 (HTTPS)
- **RDS**: Banco MySQL já configurado
- **Chave SSH**: Para acesso ao servidor

## 🔧 INSTALAÇÃO DO SERVIDOR

### PASSO 1: Conectar ao servidor
```bash
ssh -i sua-chave.pem ec2-user@SEU_IP_EC2
```

### PASSO 2: Atualizar sistema
```bash
sudo apt update && sudo apt upgrade -y
```

### PASSO 3: Instalar PHP 8.1
```bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.1-fpm php8.1-mysql php8.1-xml php8.1-mbstring php8.1-curl php8.1-zip php8.1-gd php8.1-bcmath php8.1-intl php8.1-soap php8.1-redis -y
```

### PASSO 4: Instalar Composer
```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

### PASSO 5: Instalar Nginx
```bash
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
```

### PASSO 6: Instalar MySQL Client
```bash
sudo apt install mysql-client -y
```

## 🌐 CONFIGURAÇÃO DO NGINX

### PASSO 1: Criar configuração do site
```bash
sudo nano /etc/nginx/sites-available/gopet
```

### PASSO 2: Adicionar configuração
```nginx
server {
    listen 80;
    server_name faculdog.com.br www.faculdog.com.br;
    root /var/www/gopet/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }

    # Otimizações para Laravel
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

### PASSO 3: Ativar site
```bash
sudo ln -s /etc/nginx/sites-available/gopet /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

## 🔐 CONFIGURAÇÃO SSL (HTTPS)

### PASSO 1: Instalar Certbot
```bash
sudo apt install certbot python3-certbot-nginx -y
```

### PASSO 2: Obter certificado SSL
```bash
sudo certbot --nginx -d faculdog.com.br -d www.faculdog.com.br
```

## 📁 ESTRUTURA DE DIRETÓRIOS

```
/var/www/gopet/          # Aplicação Laravel
/var/www/gopet/public/   # Document root do Nginx
/var/www/gopet/storage/  # Logs e cache
/var/log/nginx/          # Logs do Nginx
/var/log/php8.1-fpm.log  # Logs do PHP-FPM
```

## 🚀 DEPLOY AUTOMATIZADO

### PASSO 1: Configurar script de deploy
Editar `deploy-aws.sh` e alterar:
- `EC2_INSTANCE_IP`: IP do seu servidor
- `EC2_KEY_PATH`: Caminho para sua chave SSH

### PASSO 2: Executar deploy
```bash
./deploy-aws.sh
```

## 📊 MONITORAMENTO

### PASSO 1: Verificar status dos serviços
```bash
sudo systemctl status nginx
sudo systemctl status php8.1-fpm
```

### PASSO 2: Verificar logs
```bash
sudo tail -f /var/log/nginx/error.log
sudo tail -f /var/log/php8.1-fpm.log
sudo tail -f /var/www/gopet/storage/logs/laravel.log
```

## 🔧 MANUTENÇÃO

### Limpar caches
```bash
cd /var/www/gopet
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
```

### Atualizar aplicação
```bash
cd /var/www/gopet
git pull origin main
composer install --optimize-autoloader --no-dev
php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache
sudo systemctl reload nginx
sudo systemctl reload php8.1-fpm
```

## 🆘 SOLUÇÃO DE PROBLEMAS

### Erro 502 Bad Gateway
- Verificar se PHP-FPM está rodando
- Verificar permissões dos arquivos
- Verificar logs do Nginx e PHP-FPM

### Erro de permissão
```bash
sudo chown -R www-data:www-data /var/www/gopet
sudo chmod -R 755 /var/www/gopet
sudo chmod -R 775 /var/www/gopet/storage
sudo chmod -R 775 /var/www/gopet/bootstrap/cache
```

### Banco não conecta
- Verificar Security Groups do RDS
- Verificar configurações do .env
- Testar conexão: `mysql -h database-1.cs5aqw8qwo6y.us-east-1.rds.amazonaws.com -u admin -p`
