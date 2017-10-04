FROM kong:0.10.2

MAINTAINER Henrique Canto Duarte hcanto@cpqd.com.br

RUN yum -y install unzip

CMD cd /plugins && for d in ./*/ ; do (cd "$d" && luarocks make ); done && kong start
