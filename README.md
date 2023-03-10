Hostsharing-Ansible-Tapir
=========================

This Ansible playbook will install the latest [Tapir](https://github.com/SuperCoopBerlin/tapir) release on a server from www.hostsharing.net.

To use these modules we have to create a file named ".hsadmin.properties" in the home directory of the package admins. Into that file we have to insert the packagename and password of the package admin. 

Example:

    xyz00@h99:~$ cat .hsadmin.properties 
    xyz00.passWord=insertpkgadminpasswordhere

This file should be protected, else it would be world readable:

    xyz00@h99:~$ chmod 600 .hsadmin.properties

We clone this git-repo to our machine:

    $ git clone https://github.com/tpokorra/Hostsharing-Ansible-Tapir.git

Then we change the working directory:

    $ cd Hostsharing-Ansible-Tapir

All needed parameters can be set in the inventory file now. Change xyz00 to the name of your package admin. Set the name of a domain, a new user and a password. We can edit the inventory file with:

    $ cp inventory-sample.yml inventory.yml
    $ vim inventory.yml
    
The option -i can be used to read this inventory file instead of the /etc/ansible/hosts file. We want to login with an SSH-Key. We run:

    $ ansible-playbook -i inventory.yml playbook-init.yml

Make sure that the Debian package slapd is installed on your managed server.

Then ask the Hostsharing Service to install the PostgreSQL extensions hstore and unaccent. Once those have been installed, you can continue:

    $ ansible-playbook -i inventory.yml playbook-install.yml

Now we can reach our site via:

    https://tapir.example.org

Open Source Hosting
-------------------

https://www.hostsharing.net
