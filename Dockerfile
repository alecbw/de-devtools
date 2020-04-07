FROM ubuntu:18.04

# Install an apt repository management library and Ansible, a config management suite
RUN apt-get update && apt-get install -y software-properties-common git sudo
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get install -y ansible

# TODO not clear on why this is necessary
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

# Pull the repo down inside the container and use it to build itself
RUN git clone https://github.com/alecbw/de-devtools /home/de-devtools/

# Run the main main.yaml, which gets the main.yaml from each of the roles and executes the .yaml's listed in each of those main.yaml's. This does most of the work.
RUN ansible-playbook /home/de-devtools/main.yaml

# Echo the container password
RUN echo 'root:docker' | chpasswd
