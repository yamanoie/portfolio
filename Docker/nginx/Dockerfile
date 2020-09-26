FROM nginx

RUN rm -f /etc/nginx/conf.d/*

COPY /Dokcer/nginx/nginx.conf /etc/nginx.conf /etc/nginx/conf.d/segurado.conf

CMD /usr/sbin.nginx -g 'daemon off;' -c /etc/nginx/nginx.conf