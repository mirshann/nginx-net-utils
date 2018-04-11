FROM nginx:1.13.11

RUN apt-get update \
    && apt-get install -y mtr curl dnsutils netcat-openbsd jq nmap \ 
                          net-tools tcpdump iputils-ping iproute2 \
                          iftop mc vim \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]