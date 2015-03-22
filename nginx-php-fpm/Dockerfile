FROM bmichalski/nginx

RUN \
  base/configure.sh && \
  bash -c "rm /etc/nginx/sites-{available,enabled}/default" && \
  mkdir -p /var/log/nginx-vhost/vhost && \
  bash -c "touch /var/log/nginx-vhost/vhost/vhost_{error,access}.log" && \
  chown -R www-data:adm /var/log/nginx-vhost

COPY conf/etc/nginx/sites-available/default /etc/nginx/sites-available/default

RUN \
  ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

CMD \
  /root/on-startup.sh
