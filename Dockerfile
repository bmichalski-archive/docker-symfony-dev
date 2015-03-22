FROM bmichalski/nginx

RUN \
  base/configure.sh && \
  bash -c "rm /etc/nginx/sites-{available,enabled}/default"

COPY conf/etc/nginx/sites-available/default /etc/nginx/sites-available/default

RUN \
  ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

CMD \
  /root/on-startup.sh
