# scripts
helpful scripts i put together for my own use

## update-discord.sh
this script updates Discord and Discord Canary on Manjaro and other Linux distros

you'll have to have installed them through another package manager beforehand for everything to register right, i'm pretty sure

## create-vhost.sh
this script is used to create an apache2 vhost for a domain or subdomain

**usage :** sh create_vhost.sh domain name

example : sh create_vhost.sh example.com example
<br><br>
you'll need to have certbot installed, and this uses apache2, so it won't work with nginx

this'll restart apache2 for you, so all you need to do is run it and sit back, oh and do one thing in certbot that i dont know how to automate
