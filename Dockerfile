
FROM debian
RUN echo 'deb [ trusted=yes ]http://dl.winehq.org/wine-builds/debian bullseye main' >>/etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm nano winehq-devel lxde tightvncserver squid  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'squid' >>/tu.sh
RUN echo '/usr/sbin/sshd -D &' >>/tu.sh
RUN echo 'wstunnel -s 0.0.0.0:80  ' >>/tu.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /tu.sh
EXPOSE 80
CMD  /tu.sh 
