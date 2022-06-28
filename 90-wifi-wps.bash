#!/bin/sh
uci show wireless | grep wireless.wifinet1.ssid=
if [ $? -eq 0 ]; then
continu
else
        uci add wireless wifinet1
        uci set wireless.@wifinet1.network='lan'
        uci set wireless.@wifinet1.device='radio0'
        uci set wireless.@wifinet1.mode='ap'
        uci set wireless.@wifinet1.encryption='psk-mixed+tkip+aes'
        uci set wireless.@wifinet1.ssid='Invitados'
        uci set wireless.@wifinet1.key='Exo8hqVF'
        uci commit wireless
        wifi reload
fi
option device 'wifinet1'
option wifi_type 'iface'
https://forum.archive.openwrt.org/viewtopic.php?id=41610