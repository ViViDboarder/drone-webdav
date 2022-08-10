FROM alpine:3.14

RUN apk --no-cache add bash=~5.1 curl=~7.79 ca-certificates=~20220614
COPY push.sh /bin/
RUN chmod +x /bin/push.sh

ENTRYPOINT ["/bin/push.sh"]
