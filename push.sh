#! /bin/sh

# Use WEBDAV_USERNAME as default, if provided.
if [ -z "$PLUGIN_USERNAME" ] && [ ! -z "$WEBDAV_USERNAME" ]; then

    PLUGIN_USERNAME="$WEBDAV_USERNAME"
fi

# Use WEBDAV_PASSWORD as default, if provided.
if [ -z "$PLUGIN_PASSWORD" ] && [ ! -z "$WEBDAV_PASSWORD" ]; then

    PLUGIN_PASSWORD="$WEBDAV_PASSWORD"
fi

# If username and password are provided, add auth
if [ ! -z "$PLUGIN_USERNAME" ] && [ ! -z "$PLUGIN_PASSWORD" ]; then

    AUTH="--user '${PLUGIN_USERNAME}':'${PLUGIN_PASSWORD}'"
fi

# Use a proxy, if one is specified
if [ ! -z "$PLUGIN_PROXY_URL" ]; then

    PLUGIN_PROXY_URL="--proxy '${PLUGIN_PROXY_URL}'"
fi

# If a timeout is specified, make use of it.
if [ ! -z "$PLUGIN_TIMEOUT" ]; then

    PLUGIN_TIMEOUT="--max-time '${PLUGIN_TIMEOUT}'"
fi

# Set PLUGIN_ATTEMPTS to one if nothing else is specified
if [ -z "$PLUGIN_ATTEMPTS" ]; then

    PLUGIN_ATTEMPTS=1
fi

# Repeat the upload as long as specified.
while [ "${PLUGIN_ATTEMPTS}" -gt 0 ]; do

    # Uploading the file
    curl $PLUGIN_PROXY_URL $PLUGIN_TIMEOUT $PLUGIN_CUSTOM_ARGUMENTS --upload-file $PLUGIN_FILE $AUTH $PLUGIN_DESTINATION && {

        # Terminate the script as soon as the upload is successful
        echo "[INFO] Upload was successful."
        exit 0

    }

    # Show messages in case uploads have failed
    [ "$PLUGIN_ATTEMPTS" -gt 1 ] && {

        echo "[INFO] Upload failed. Attempting a new upload, if possible."

    }

    PLUGIN_ATTEMPTS=$((PLUGIN_ATTEMPTS-1))

done

# Returns an error because the upload was not successful
echo "[ERROR] All upload attempts have failed."
exit 1
