echo "Checking that all services are up and working correctly"

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ../tasks/status.yml
