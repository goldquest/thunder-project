#!/bin/sh

if [ ! -f docroot/sites/default/settings.php ]; then
	echo "settings.php missing, creating one"
	cp .docker/settings.docker.php docroot/sites/default/settings.php
fi
composer install
sed -i.bak "s/\/var\/www\/html$/\/var\/www\/html\/docroot/g" /etc/apache2/sites-available/000-default.conf
apache2-foreground
