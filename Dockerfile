# --------------------------------------------------------------------
# | 
# | CONFIG: /etc/nginx/nginx.conf
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
    
EXPOSE 80

CMD ["/usr/sbin/nginx", "-D", "daemon off;"]


# ----------------------------------------------------------------

ONBUILD ADD sites-enabled/ /etc/nginx/sites-enabled/
ONBUILD ADD app/ /app/
