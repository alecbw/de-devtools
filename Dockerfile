FROM ubuntu:18.04
RUN echo $HOME
RUN apt-get update && apt-get install -y software-properties-common git sudo
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get install -y ansible

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN git clone https://github.com/alecbw/de-devtools /home/de-devtools/
RUN echo $(ls)
RUN ansible-playbook /home/de-devtools/main.yaml
RUN echo 'root:docker' | chpasswd
