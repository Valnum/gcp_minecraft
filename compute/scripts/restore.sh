#!/bin/bash
gsutil -m cp -R "gs://${YOUR_BUCKET_NAME}-minecraft-backup/config/*" "/home/minecraft"
gsutil -m cp -R "gs://${YOUR_BUCKET_NAME}-minecraft-backup/worlds/*" "/home/minecraft/worlds/"
