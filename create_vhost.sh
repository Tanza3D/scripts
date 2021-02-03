# this manages http redirection and https VHOST setup, with an example php file
# this uses apache2, so if your using nginx it probably won't work
# make sure to install certbot beforehand, else it won't work
# you'll also have to setup your DNS beforehand, as well
# this also probably won't work with cloudflare

# USAGE : sh create_vhost.sh domain name
# example: sh create_vhost.sh tictimer.untone.tk tictimer

echo "Creating files..."

touch /etc/apache2/sites-enabled/$1.vhost
mkdir /var/www/$2

ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

echo "Adding content to vhost..."

echo "<VirtualHost $ip4:80>
    ServerAdmin webmaster@localhost
    ServerName $1
    DocumentRoot /var/www/$2
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

<VirtualHost $ip4:443>
    ServerAdmin webmaster@localhost
    ServerName $1
    DocumentRoot /var/www/$2
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

<Directory $2>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
" > /etc/apache2/sites-enabled/$1.vhost

echo "Adding example PHP file..."

touch /var/www/$2/index.php

echo "Hubz's Website Creation Script > $1<br>If you are seeing this, the website was created correctly. You can find the files at /var/www/$2." > /var/www/$2/index.php

echo "Restarting Apache2..."

systemctl restart apache2

echo "Adding certificate..."

certbot -d $1

echo "Restarting Apache2..."

systemctl restart apache2

echo "Done! Your new website should be now accessable at $1!"
