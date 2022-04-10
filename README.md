#Ansible project to setup a k8s cluster#
#This ansible program is used to configure a kubernetes cluster (01 master and two worker nodes).
If you want more node, edit inventory file and add the new node (fqdn) in the appropriate group.
Container Runtime used: containerd
Stable OS: Ubuntu Server 20.04+
Ansible version: Engine 2.7+

If you want to modify the default kubernetes version (1.23.0-00), edit the file roles/k8s-cluster/vars/main.yml and mention it

=> To launch
1. In first:
  Ensure root user had an knowm password 
  Ensure ssh installed and configured to allow root user connection
  Ensure fqdn for node is well mentioned in the inventory file
2. Launch file called setupusers.sh which must have 02 parameters (Username and password that will be created on master and worker node)
Example: ./setupusers.sh username  password
         ./setupusers.sh automation automation
3. Finally, launch the ansible playbook callrole.yml in the appropriate directory
Example: ansible-playbook callrole.yml

By Vianney NOUTENIJEU
