#!/usr/bin/env bash
set -e

# Extract values from the HAOS config file using jq
export MQTT_HOST=$(jq --raw-output '.mqtt_host' /data/options.json)
export MQTT_PORT=$(jq --raw-output '.mqtt_port' /data/options.json)
export MQTT_USERNAME=$(jq --raw-output '.mqtt_username' /data/options.json)
export MQTT_PASSWORD=$(jq --raw-output '.mqtt_password' /data/options.json)
export DEVICES=$(jq --raw-output '.devices' /data/options.json)

# Execute the main application (update the target script filename if necessary)
exec python3 main.py
