
FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm nano  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo '/usr/sbin/sshd -D &' >>/tu.sh
RUN echo 'wstunnel -s 0.0.0.0:8989  ' >>/tu.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /tu.sh
EXPOSE 80
CMD  /tu.sh 
