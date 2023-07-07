FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install wget 
RUN wget https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_linux_amd64.gz
RUN gunzip chisel_1.8.1_linux_amd64.gz
RUN mv chisel_1.8.1_linux_amd64 /bin/chisel
RUN chmod 755 /bin/chisel
RUN echo 'chisel server -p 9903' >>/tu.sh
RUN chmod 755 /tu.sh
EXPOSE 9903
CMD  /tu.sh 
