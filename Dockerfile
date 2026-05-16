FROM php:8.2-apache

# PHPの古い構文警告（Deprecated）を画面に非表示にする設定 (★ここを追加)
RUN echo "error_reporting = E_ALL & ~E_DEPRECATED" > $PHP_INI_DIR/conf.d/disable-deprecated.ini

# 1. RackTablesの動作に必要なPHP拡張をインストール
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo_mysql mysqli bcmath \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Apacheの公開先を wwwroot サブフォルダに変更 (★ここを追加)
RUN sed -i 's|/var/www/html|/var/www/html/wwwroot|g' /etc/apache2/sites-available/000-default.conf

# 3. RackTablesの最新ソースコードをGitHubから取得して配置
ADD https://github.com/RackTables/racktables/archive/refs/heads/master.tar.gz /tmp/racktables.tar.gz

RUN tar -xzf /tmp/racktables.tar.gz -C /var/www/html --strip-components=1 \
    && rm /tmp/racktables.tar.gz \
    && chown -R www-data:www-data /var/www/html
