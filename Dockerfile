FROM kong:0.11

MAINTAINER Henrique Canto Duarte hcanto@cpqd.com.br

RUN yum -y install unzip

ADD load_kong_conf.sh /etc/kong

CMD /etc/kong/load_kong_conf.sh > /etc/kong/kong.conf ; \
    cd /plugins && \
    for d in $(find . -name *.rockspec -printf "%h\n") ; do (cd "$d" && luarocks make && cd -); done ; \
    kong start

