FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget nano   -y
RUN wget https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_linux_amd64.gz
RUN gunzip chisel_1.8.1_linux_amd64.gz
RUN mv chisel_1.8.1_linux_amd64 /bin/chisel
RUN chmod 755 /bin/chisel
RUN mkdir /run/sshd 
RUN echo '/usr/sbin/sshd -D &' >>/tu.sh
RUN echo 'chisel server' >>/tu.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /tu.sh
EXPOSE 80
CMD  /tu.sh 
