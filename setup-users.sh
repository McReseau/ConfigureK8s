#!/bin/bash
ansible all -m user -a "name=$1 state=present groups=sudo append=yes shell=/bin/bash password=\"{{ '$2' | password_hash('sha512', '1234567') }}\" generate_ssh_key=yes ssh_key_bits=2048 ssh_key_file=.ssh/id_rsa" -u root --ask-pass
ansible all -m file -a "path=/etc/sudoers.d/$1 state=touch" -u root --ask-pass
ansible all -m copy -a "content='$1 ALL=(ALL) NOPASSWD: ALL' dest=/etc/sudoers.d/$1" -u root --ask-pass
ansible all -m authorized_key -a "user=$1 key=\"{{lookup(\'file\',\'/home/$1/.ssh/id_rsa.pub\')}}\"" -u root --ask-pass
ansible all -m ping
