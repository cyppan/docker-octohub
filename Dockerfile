FROM buildpack-deps:jessie
MAINTAINER cyprien.pannier@gmail.com

RUN apt-get update && apt-get install -y \
      build-essential \
      python \
      python-pip && \
      rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*
RUN pip install requests simplejson

RUN git clone https://github.com/turnkeylinux/octohub.git /root/octohub
WORKDIR /root/octohub
RUN make install

ENV OCTOHUB_LOGLEVEL=ERROR

ENTRYPOINT ["octohub"]

