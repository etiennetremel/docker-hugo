FROM alpine:3.7
ENV HUGO_VERSION=0.62.1
WORKDIR /root
RUN apk add --update openssl \
  && wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
  && tar xvzf ./hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

FROM scratch
WORKDIR /root/
COPY --from=0 /root/hugo .
ENTRYPOINT ["./hugo"]
