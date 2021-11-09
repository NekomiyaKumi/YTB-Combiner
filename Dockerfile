FROM alpine:edge

LABEL maintainer="Orwill Q. Song <orwill@anislet.dev>"

COPY ./entrypoint.sh /

RUN set -x \
    && apk add --no-cache ca-certificates ffmpeg yt-dlp rclone \
    && chmod a+rx /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
