FROM alpine
MAINTAINER ViViDboarder <ViViDboarder@gmail.com>

RUN apk -Uuv add curl ca-certificates
ADD push.sh /bin/
RUN chmod +x /bin/push.sh

ENTRYPOINT /bin/push.sh
