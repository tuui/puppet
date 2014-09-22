--- used setup files ---
* vagrant_1.6.5.msi
* VirtualBox-4.3.14-95030-Win.exe

--- tips ---
* for java7 add modules/java7/files/jdk-7u67-linux-i586.tar.gz

--- connect to mysql ---


Define a static ip for your box like in this example:
config.vm.network "private_network", ip: "192.168.33.101"

In Mysql Workbench create a new connection over SSH:
Connection Method: Standard TCP/IP over SSH
SSH Hostname: 192.168.33.101 (like above)
SSH Username: vagrant
SSH password: vagrant
MySQL Hostname: 127.0.0.1
MySQL Username: root
MySQL Password: root

