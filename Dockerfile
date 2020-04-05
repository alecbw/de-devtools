FROM ubuntu:18.04
COPY . /home
CMD sudo apt update
CMD sudo apt install software-properties-common
CMD sudo apt-add-repository --yes --update ppa:ansible/ansible
CMD sudo apt install ansible
CMD ansible-pull -U https://github.com/angelddaz/ansible.git
