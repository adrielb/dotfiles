
IPFILE=/tmp/whisperquiet.ip

/sbin/ip addr|grep 'inet ' > $IPFILE 

scp $IPFILE abergman@levlabnas:

