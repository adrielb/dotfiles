sudo alien -v --to-deb MegaCli-8.07.14-1.noarch.rpm

sudo apt install ./megacli_8.07.14-2_all.deb

cd /opt/MegaRAID/MegaCli/

./MegaCli64 -h

sudo ./MegaCli64 -adpCount

sudo ./MegaCli64 -PDList -a0

sudo ./MegaCli64 -PDList -a0 | grep alert

sudo ./MegaCli64 -PDList -a0 | grep Error

sudo ./MegaCli64 -EncInfo -a0

sudo ./MegaCli64 -LDList -Lall -a0

sudo ./MegaCli64 -ShowSummary -a0

sudo ./MegaCli64 -ShowSummary -a0 | grep State
sudo ./MegaCli64 -ShowSummary -a0 | grep Status

sudo ./MegaCli64 -LdPdInfo -a0

sudo ./MegaCli64 -AdpBbuCmd -a0

sudo ./MegaCli64 -ConfigInfo

