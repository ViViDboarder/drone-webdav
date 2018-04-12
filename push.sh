#! /bin/sh

# Use WEBDAV_USERNAME or WEBDAV_PASSWORD as default, if provided
if [ -z "$PLUGIN_USERNAME" ] && [ ! -z "$WEBDAV_USERNAME" ]; then
    PLUGIN_USERNAME="$WEBDAV_USERNAME"
fi
if [ -z "$PLUGIN_PASSWORD" ] && [ ! -z "$WEBDAV_PASSWORD" ]; then
    PLUGIN_PASSWORD="$WEBDAV_PASSWORD"
fi

# If username and password are provided, add auth
if [ ! -z "$PLUGIN_USERNAME" ] && [ ! -z "$PLUGIN_PASSWORD" ]; then
    AUTH="-u ${PLUGIN_USERNAME}:${PLUGIN_PASSWORD}"
fi

curl -T $PLUGIN_FILE $AUTH $PLUGIN_DESTINATION
