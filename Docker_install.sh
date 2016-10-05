#!/bin/sh

composer install
{ \
	echo "\$dockerMysqlHost = getenv('THUNDER_DB_HOST');"; \
	echo "if(\$dockerMysqlHost) {"; \
	echo "\t\$databases['default']['default'] = array("; \
	echo "\t\t'driver' => 'mysql',"; \
	echo "\t\t'database' => 'thunder',"; \
	echo "\t\t'username' => 'thunder',"; \
	echo "\t\t'password' => 'thunder',"; \
	echo "\t\t'host' => \$dockerMysqlHost,"; \
	echo "\t\t'port' => 3306 );"; \
	echo "}"; \
} >> "docroot/sites/default/settings.php"
