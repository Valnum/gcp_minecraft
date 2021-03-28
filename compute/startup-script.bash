#!/bin/bash
# Minecraft Bedrock server startup script using screen
sudo -i
sudo mount /dev/sda1 /home/minecraft

# Check if server is already started
if screen -list | grep -q "servername"; then
    echo "Server is already started!  Press screen -r servername to open it"
    exit 1
fi

# Change directory to server directory
cd /home/minecraft

# Retrieve latest version of Minecraft Bedrock dedicated server
echo "Checking for the latest version of Minecraft Bedrock server ..."

# Test internet connectivity first
wget --quiet http://www.minecraft.net/ -O /dev/null
if [ "$?" != 0 ]; then
    echo "Unable to connect to update website (internet connection may be down).  Skipping update ..."
else
    # Download server index.html to check latest version
    wget -O downloads/version.html https://minecraft.net/en-us/download/server/bedrock/
    DownloadURL=$(grep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*' downloads/version.html)
    DownloadFile=$(echo "$DownloadURL" | sed 's#.*/##')

    # Download latest version of Minecraft Bedrock dedicated server if a new one is available
    if [ -f "downloads/$DownloadFile" ]
    then
        echo "Minecraft Bedrock server is up to date..."
    else
        echo "New version $DownloadFile is available.  Updating Minecraft Bedrock server ..."
        wget -O "downloads/$DownloadFile" "$DownloadURL"
        unzip -o "downloads/$DownloadFile" -x "*server.properties*" "*permissions.json*" "*whitelist.json*" "*valid_known_packs.json*"
    fi
fi

echo "Starting Minecraft server.  To view window type screen -r servername"
echo "To minimize the window and let the server run in the background, press Ctrl+A then Ctrl+D"

screen -dmS servername /bin/bash -c "LD_LIBRARY_PATH=. ./bedrock_server"