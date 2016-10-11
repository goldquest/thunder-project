#!/bin/sh


composer install
if [ ! -f docroot/sites/default/settings.docker.php ]; then
	cp .docker/settings.docker.php docroot/sites/default/settings.docker.php
	cat .docker/add-to-settings >> docroot/sites/default/settings.php
fi
sed -i.bak "s/\/var\/www\/html$/\/var\/www\/html\/docroot/g" /etc/apache2/sites-available/000-default.conf
apache2-foreground
