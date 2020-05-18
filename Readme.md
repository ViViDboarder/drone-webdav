# drone-webdav
A WebDAV plugin, for the drone.io project, which allows you to push build artifacts to any WebDAV server, including Nextcloud or ownCloud.

## Examples

An example configuration would be as follows:

```yaml
pipeline:
  upload_debug:
    image: vividboarder/drone-webdav
    file: com.vividboarder.otbeta/build/outputs/apk/com.vividboarder.otbeta-debug.apk
    destination: https://my.nextcloud.com/remote.php/dav/files/vividboarder/Android/Apks/
    user: myusername
    password: mypassword
```

You probably don't want to check your credentials into your repo, so you may use secrets for this:

```yaml
pipeline:
  upload_debug:
    image: vividboarder/drone-webdav
    file: com.vividboarder.otbeta/build/outputs/apk/com.vividboarder.otbeta-debug.apk
    destination: https://my.nextcloud.com/remote.php/dav/files/vividboarder/Android/Apks/
    secrets:
      - source: WEBDAV_USER
        target: PLUGIN_USERNAME
      - source: WEBDAV_PASSWORD
        target: PLUGIN_PASSWORD
```

## FAQ

#### How do I upload multiple files at once?
Since this script uses **curl** to upload your files, you can use it's corresponding syntax.<br>
An example, taken from the official [documentation](https://curl.haxx.se/docs/manpage.html#-T), would be to pass ``{dogs.png,cats.jpg}`` to ``PLUGIN_FILE``.

## Customization

The following environment variables can be used for further cutomization:

| Variable                    | Description                                                                                              |
|-----------------------------|----------------------------------------------------------------------------------------------------------|
| ``PLUGIN_PROXY_URL``        | May be used to specify a proxy (e.g. ``socks5://{ip_address}:{port}``)                                   |
| ``PLUGIN_TIMEOUT``          | Defines a timeout (in seconds) to stop the upload after a certain time.                                  |
| ``PLUGIN_ATTEMPTS``         | Defines how often a failed upload should be retried. Normally there is only one upload attempt.          |
| ``PLUGIN_CUSTOM_ARGUMENTS`` | Additional arguments to be passed to `curl`.                                                             |
