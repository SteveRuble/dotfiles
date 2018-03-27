sudo killall wpa_supplicant
sudo wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/home.conf
sudo dhcpcd -x
sudo dhcpcd
