#!/bin/bash
# Minecraft Server stop script - primarily called by minecraft service but can be ran manually

sudo -i
/home/minecraft/backup.sh

screen -Rd servername -X stuff "stop$(printf '\r')"

screen -S servername -X quit