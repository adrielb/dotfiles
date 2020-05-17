sudo alien -v --to-deb MegaCli-8.07.14-1.noarch.rpm

sudo apt install ./megacli_8.07.14-2_all.deb

cd /opt/MegaRAID/MegaCli/

./MegaCli64 -h

sudo ./MegaCli64 -adpCount

sudo ./MegaCli64 -CfgForeign -Scan -a0

sudo ./MegaCli64 -PDList -a0

sudo ./MegaCli64 -PDList -a0 | grep 'Firmware state'

sudo ./MegaCli64 -PDList -a0 | grep Foreign

sudo ./MegaCli64 -PDList -a0 | grep alert

sudo ./MegaCli64 -PDList -a0 | grep Error

sudo ./MegaCli64 -EncInfo -a0

sudo ./MegaCli64 -LDList -Lall -a0

sudo ./MegaCli64 -LDInfo -LAll -aAll

sudo ./MegaCli64 -LDInfo -LAll -aAll | grep "Cache Policy:"

sudo ./MegaCli64 -CfgDsply -a0 | grep Cache


sudo ./MegaCli64 -ShowSummary -a0

sudo ./MegaCli64 -ShowSummary -a0 | grep State
sudo ./MegaCli64 -ShowSummary -a0 | grep Status

sudo ./MegaCli64 -LdPdInfo -a0

sudo ./MegaCli64 -AdpBbuCmd -a0

sudo ./MegaCli64 -ConfigInfo -a0

sudo ./MegaCli64 -GetPreservedCacheList -a0

sudo ./MegaCli64 -AdpAllInfo -aALL
# Default Settings
# Write Policy : WB
# Read Policy  : Adaptive
# Cache When BBU Bad  : Disable
# Cached IO           : No
# Enable JBOD  : No

sudo ./MegaCli64 -LDSetProp -ForcedWB -Immediate -Lall -aAll
sudo ./MegaCli64 -LDSetProp -Cached -Immediate -Lall -aAll
sudo ./MegaCli64 -LDSetProp -EnDskCache -Immediate -Lall -aAll
sudo ./MegaCli64 -LDSetProp -CachedBadBBU -Immediate -Lall -aAll


sudo ./MegaCli64 -AdpEventLog -GetEvents -f /tmp/events.log -aAll

sudo ./MegaCli64 -AdpEventLog -GetEvents -warning -f /tmp/events.log -aAll
