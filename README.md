# Ansible-Network

Vagrant + Ansible to automatically display the network shown with all the included services. All the machines have netdata installed to monitor all services and usage for each one of them.

![alt tag](https://i.gyazo.com/e76d140832982c61365daa4f7f35436e.png)

During the installation ansible will prompt a series of variables for futher customization.

# How to run:

      git clone https://github.com/Externoak/Ansible-Network.git
      
      cd Ansible-Network
      
      sh start.sh
      
# How to access:

      The password for root or admin that is not especified by any variable is "vagrant".
      
      HAProxy will get an IP by DHCP unless specified in the vagrantfile this IP will be the only one needed.
      
      LDAP domain: dc=nodomain

      To access LDAP server from a remote client use the IP assinged by DHCP and cn=admin,dc=nodomain. 
      The password for LDAP admin will be the one specified by the user during installation.
            
      Netdata: 
      This should only be needed once, since netdata will save each hostname to my-netdata with it's correspondent IP.
      
               HAProxyIP:19999 --> HAProxy netdata
               HAProxyIP:19990 --> Moodle netdata
               HAProxyIP:19991 --> Apache1 netdata
               HAProxyIP:19992 --> Apache2 netdata
               HAProxyIP:19993 --> Asterisk1 netdata
               HAProxyIP:19994 --> Asterisk2 netdata
               HAProxyIP:19995 --> Ftpserver netdata
               HAProxyIP:19996 --> MySQL1 netdata
               HAProxyIP:19997 --> MySQL2 netdata
               HAProxyIP:19998 --> LDAP netdata
               
       Web browser:
       
               HAProxyIP:8080/haproxyadmin?stats
               By default (port 80) will load balance between both apache servers.
               
               HAProxyIP/moodle
               To access Moodle.
               
               HAProxyIP:9090
               To access Openfire panel.
      
      External clients:
               Services will use default ports.
               
               HAProxyIP:3306 --> MySQL
               HAProxyIP:5060 --> Asterisk
               HAProxyIP:5222 --> Openfire
               HAProxyIP:389 --> LDAP
               HAProxyIP:21 --> FTP
               
      Inside the Management folder various useful scripts to manage the diferent services shall be found.
               
  
               
               
               
               
               
               
              
           
      
               
               
