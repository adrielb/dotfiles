apt install samba

smbpasswd -a abergman

mkdir /data/share

vim /etc/samba/smb.conf
# [UbuntuSharedDir]
# path = /home/hendadel/UbuntuSharedDir
# available = yes
# valid users = hendadel
# read only = no
# browsable = yes
# public = yes
# writable = yes

service smbd restart
