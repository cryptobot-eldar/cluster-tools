#Create datastore folder  and all needed folders inside
mkdir /datastore/elastic
mkdir /datastore/gitlab-runner
mkdir /datastore/jenkins
mkdir /datastore/prometheus
mkdir /datastore/nfs/mysql
mkdir /datastore/nfs
mkdir /datastore/nfs/charts
mkdir /datastore/nfs/tools
mkdir /datastore/nfs/tools/results

#Install nfs server packages
yum install nfs-utils
chmod -R 755 /datastore/nfs
chown nfsnobody:nfsnobody /datastore/nfs

systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap

echo '/exports/nfsshare               *(rw,sync,fsid=0,crossmnt,no_subtree_check,no_root_squash)' > /etc/exports
echo '/datastore/nfs/      /exports/nfsshare/  none    bind' >> /etc/fstab
