FROM alpine/helm
COPY entrypoint.sh /entrypoint.sh
RUN apk add --no-cache bash \
  && chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
