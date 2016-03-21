FROM alpine:3.3

RUN apk update \
 && apk add openvpn openvpn-auth-ldap \
 && apk add tcpdump perl-net-telnet mtr

ENV config_file=/etc/openvpn/server.conf
EXPOSE 1194
VOLUME [ "/etc/openvpn", "/var/log/openvpn" ]

ADD bootstrap.sh /usr/local/bin/

CMD [ "/usr/local/bin/bootstrap.sh" ]
