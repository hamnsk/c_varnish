FROM centos:centos7
MAINTAINER Sergey Visman admin@sergeyvisman.ru

RUN yum upgrade -y && \
  yum install -y epel-release && \
  yum install -y jemalloc libedit gcc logrotate initscripts systemd-sysv && \
  yum install -y https://repo.varnish-cache.org/pkg/5.0.0/varnish-5.0.0-1.el7.x86_64.rpm && \
  yum install -y libmhash-devel && \
  yum clean all


ADD start.sh /start.sh

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      256m
ENV VARNISHD_PARAMS -p thread_pool_min=1 -p thread_pool_max=1000 -p default_ttl=3600 -p default_grace=3600 -P /var/run/varnish.pid

CMD /start.sh
EXPOSE 6081 6082