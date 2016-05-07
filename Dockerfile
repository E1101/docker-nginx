# --------------------------------------------------------------------
# |
# |
# |
# |
# |
# |
FROM ubuntu
MAINTAINER Payam Naderi <naderi.payam@gmail.com>

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/usr/sbin/nginx"]


# ----------------------------------------------------------------

ONBUILD ADD sites-enabled/ /etc/nginx/sites-enabled/
ONBUILD ADD app/ /app/
