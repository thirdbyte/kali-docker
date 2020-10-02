FROM kalilinux/kali-rolling

WORKDIR /root/

RUN echo "deb http://kali.download/kali kali-rolling main contrib non-free" > /etc/apt/sources.list

RUN apt-get -y clean && apt-get -y update && apt-get -y dist-upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y \
   nano curl wget net-tools build-essential iputils-ping pciutils bash-completion && \
   apt-get -y autoremove && \
   apt-get -y clean

COPY packages.txt /root/
RUN cat /root/packages.txt | xargs apt-get -y install
RUN rm -rf /root/packages.txt

RUN curl https://gist.githubusercontent.com/thirdbyte/1569ae48ba7126478484a38c06d1ec48/raw/2d9fa5e27830135c7f305301264d71c8b94d9f06/.bashrc > /root/.bashrc

CMD ["/bin/bash"]
