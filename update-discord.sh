#!/bin/bash
# often times on linux, discord updates it's installer but doesn't update it's packages for a day or two, so you're left with manually installing it
# this does that for you, :3
mkdir canary
mkdir stable
wget -O canary.tar.gz "https://discord.com/api/download/canary?platform=linux&format=tar.gz"
wget -O stable.tar.gz "https://discord.com/api/download/stable?platform=linux&format=tar.gz"
tar -xf canary.tar.gz -C .
tar -xf stable.tar.gz -C .
rm canary.tar.gz
rm stable.tar.gz
cd DiscordCanary
sudo cp -r . /opt/discord-canary
cd ..
cd Discord
sudo cp -r . /opt/discord
cd ..
rm -rf DiscordCanary
rm -rf Discord
