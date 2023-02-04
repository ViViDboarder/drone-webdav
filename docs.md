---
name: WebDAV

description: plugin to publish any artifacts to any WebDAV server
authors: vividboarder
tags: [deploy, publish]
containerImage: vividboarder/drone-webdav
containerImageUrl: https://hub.docker.com/r/vividboarder/drone-webdav
url: https://github.com/vividboarder/drone-webdav
---

A [Drone CI](https://www.drone.io/) / [Woodpecker CI](https://woodpecker-ci.org/) plugin,
that will allow pushing build artifacts to any [WebDAV](http://www.webdav.org/) server, including Nextcloud or ownCloud.

## Features

- Upload multiple files
- Use a proxy
- Retry on fail

## Settings

| Settings Name      | Required | Description
| ------------------ |--------- | --------------------------------------------
| `file`             | **✓**    | File(s) to upload. Use [curl syntax](https://curl.se/docs/manpage.html#-T) for multiple (e.g. `{dogs.png,cats.jpg}`)
| `destination`      | **✓**    | The WebDav **folder** url
| `username`         | **✓**    | The WebDav-**User** to use
| `password`         |          | The **Password** for the WebDav-User
| `proxy_url`        |          | May be used to specify a proxy (e.g. `socks5://{ip_address}:{port}`
| `timeout`          |          | Defines a timeout (in seconds) to stop the upload after a certain time
| `attempts`         |          | Defines how often a failed upload should be retried. Normally there is only one upload attempt
| `custom_arguments` |          | Additional arguments to be passed to [`curl`](https://curl.se/)

## Example

```yaml
pipeline:
  upload_debug:
    image: vividboarder/drone-webdav
    settings:
      file: com.vividboarder.otbeta/build/outputs/apk/com.vividboarder.otbeta-debug.apk
      destination: https://my.nextcloud.com/remote.php/dav/files/vividboarder/Android/Apks/
      username:
        from_secret: WEBDAV_USER
      password:
        from_secret: WEBDAV_PASSWORD
```
