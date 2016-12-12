

# making cache_dir
mkdir /home/squid
chown -R proxy.proxy /home/squid
squid3 -z

/etc/init.d/squid3 restart


## get new ad server list
curl -sS -L --compressed "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&mimetype=plaintext" > /etc/squid/ad_block.txt 

## refresh squid
squid -k reconfigure


# /etc/squid3/squid.conf
cache_dir aufs /home/squid 1000 16 256

acl filecachetype urlpath_regex \.pdf
cache deny !filecachetype

acl ads dstdomain_regex -i "/etc/squid3/ad_block.txt"
http_access deny ads

