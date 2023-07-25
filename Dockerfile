FROM alpine:3.17

RUN apk --no-cache add bash=~5 curl=~8 ca-certificates=~20230506
COPY push.sh /bin/
RUN chmod +x /bin/push.sh

ENTRYPOINT ["/bin/push.sh"]
