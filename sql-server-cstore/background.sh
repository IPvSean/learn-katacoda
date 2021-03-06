#!/bin/bash

#Create an output file
touch /root/post-run.log

#Download the WWImporters database
curl -o /root/WW.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak
mv /root/WW.bak /var/opt/mssql/data/

#Download the install script and run it
curl -o /root/install_sql.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/install_sql2019.sh
sudo chmod +x ./install_sql.sh

sudo ./install_sql.sh &>> /root/post-run.log
export HOSTNAME=`hostname --all-fqdns`

firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

systemctl --now enable httpd

#Create a done file to signal we have finished
touch /root/post-run.log.done
