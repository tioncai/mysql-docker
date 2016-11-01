FROM alpine

MAINTAINER zhangxc <zhangxingcai@ghostcloud.cn>

LABEL Verdor="Ghostcloud" \
      Name="mysql:alpine" \
      Verson="1.0.0" \
      Date="1/11/2016"

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3306
ENTRYPOINT ["/entrypoint.sh"]
