#!/bin/bash
clear
while :
do
echo " Choose a network estructure "
echo "1. Basic LAMP (HAProxy, Apache, MySQL)"
echo "2. Basic LAMP + Moodle + LDAP"
echo "3. Basic LAMP + Moodle + LDAP + FTP/Openfire"
echo "4. Give me everything ;)"
echo "5. Salir"
echo -n "Seleccione una opcion [1 - 5]"
read opcion
case $opcion in
1) echo "Creating 1. Basic LAMP (HAProxy, Apache, MySQL)";
vagrant up HAProxy --no-provision && vagrant up Apache1 --no-provision && vagrant up Apache2 --no-provision && vagrant up Mysql1 --no-provision && vagrant up Mysql2 --no-provision
vagrant provision
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/HAProxy/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Apache/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/mysql.yml
echo "Finish creating  Basic LAMP";;
2) echo "Creating 2. Basic LAMP + Moodle + LDAP";
vagrant up HAProxy --no-provision && vagrant up Apache1 --no-provision && vagrant up Apache2 --no-provision && vagrant up Mysql1 --no-provision && vagrant up Mysql2 --no-provision &&  vagrant up Moodle --no-provision && vagrant up ldap --no-provision
vagrant provision
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/HAProxy/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Apache/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Moodle/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/mysql.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/ldap.yml
echo "Finish creating  Basic LAMP + Moodle + LDAP";;
3) echo "Creating 3. Basic LAMP + Moodle + LDAP + FTP/Openfire";
vagrant up HAProxy --no-provision && vagrant up Apache1 --no-provision && vagrant up Apache2 --no-provision && vagrant up Mysql1 --no-provision && vagrant up Mysql2 --no-provision &&  vagrant up Moodle --no-provision && vagrant up ldap --no-provision && vagrant up ftpserver --no-provision
vagrant provision
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/HAProxy/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Apache/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Moodle/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/mysql.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/ldap.yml
echo "Finish creating  Basic LAMP + Moodle + LDAP + FTP/Openfire";;
4) echo "Everthing";
vagrant up --no-provision
vagrant provision
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/HAProxy/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Apache/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Asterisk/tasks.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/Moodle/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/main.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/mysql.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/FTP-Mysql-LDAP/ldap.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tasks/status.yml
echo "Finish creating Everything";;
5) echo "Bye, have a great time!";
exit 1;;
*) echo "$opc Is not a valid option.";
echo "Press a key to continue...";
read foo;;
esac
done
