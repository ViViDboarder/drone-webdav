#! /bin/sh

# If username and password are provided, add auth
if [ ! -z "$PLUGIN_USERNAME" ] && [ ! -z "$PLUGIN_PASSWORD" ]; then
    AUTH="-u ${PLUGIN_USERNAME}:${PLUGIN_PASSWORD}"
fi
curl -T $PLUGIN_FILE $AUTH $PLUGIN_DESTINATION
