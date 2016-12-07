# --------------------------------------------------------------------
# | 
# | CONFIG: /etc/nginx/nginx.conf
# |
# |
# |
# |
FROM ubuntu
MAINTAINER Payam Naderi <naderi.payam@gmail.com>

RUN apt-get update \
    && apt-get install -y \
        nginx \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

# ----------------------------------------------------------------

ONBUILD ADD sites-enabled/ /etc/nginx/sites-enabled/
ONBUILD ADD app/ /app/
