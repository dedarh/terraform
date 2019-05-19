#!/bin/bash
TOKEN=$(yc config list | grep 'token:' | cut -d' ' -f2)
CLOUD_ID=$(yc config list | grep 'cloud-id' | cut -d' ' -f2)
FOLDER_ID=$(yc config list | grep 'folder-id:' | cut -d' ' -f2)

cat > terraform.tfvars << EOM
ya-token     = "$TOKEN"
ya-cloud-id  = "$CLOUD_ID"
ya-folder-id = "$FOLDER_ID"
ya-zone      = "ru-central1-c"

EOM
