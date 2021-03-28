#!/bin/bash
'/save-all\n/save-off\n'
/usr/bin/gsutil -m cp -R /home/minecraft/worlds/* gs://${YOUR_BUCKET_NAME}-minecraft-backup/world
'/save-on\n'


/usr/bin/gsutil -m cp -R /home/minecraft/server.properties gs://${YOUR_BUCKET_NAME}-minecraft-backup/config/
/usr/bin/gsutil -m cp -R /home/minecraft/permissions.json gs://${YOUR_BUCKET_NAME}-minecraft-backup/config/
/usr/bin/gsutil -m cp -R /home/minecraft/whitelist.json gs://${YOUR_BUCKET_NAME}-minecraft-backup/config/
/usr/bin/gsutil -m cp -R /home/minecraft/valid_known_packs.json gs://${YOUR_BUCKET_NAME}-minecraft-backup/config/
/usr/bin/gsutil -m cp -R /home/minecraft/*.sh gs://${YOUR_BUCKET_NAME}-minecraft-backup/config/