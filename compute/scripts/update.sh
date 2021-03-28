# Change directory to server directory
sudo cd /home/minecraft

# Retrieve latest version of Minecraft Bedrock dedicated server
echo "Checking for the latest version of Minecraft Bedrock server ..."

# Test internet connectivity first
wget --quiet http://www.minecraft.net/ -O /dev/null
if [ "$?" != 0 ]; then
    echo "Unable to connect to update website (internet connection may be down).  Skipping update ..."
else
    # Download server index.html to check latest version
    sudo wget -O downloads/version.html https://minecraft.net/en-us/download/server/bedrock/
    sudo DownloadURL=$(grep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*' downloads/version.html)
    sudo DownloadFile=$(echo "$DownloadURL" | sed 's#.*/##')

    # Download latest version of Minecraft Bedrock dedicated server if a new one is available
    if [ -f "downloads/$DownloadFile" ]
    then
        echo "Minecraft Bedrock server is up to date..."
    else
        echo "New version $DownloadFile is available.  Updating Minecraft Bedrock server ..."
        sudo wget -O "downloads/$DownloadFile" "$DownloadURL"
        sudo unzip -o "downloads/$DownloadFile" -x "*server.properties*" "*permissions.json*" "*whitelist.json*" "*valid_known_packs.json*"
    fi
fi