echo "Dumping SQL "

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ../tasks/FTP-Mysql-LDAP/dump.yml

