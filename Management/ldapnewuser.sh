echo "Adding new user to LDAP server "

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ../tasks/FTP-Mysql-LDAP/newuser.yml

echo "LDAP new user script has finished"
