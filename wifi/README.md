Copy the `wpa_supplicant.conf` file to path `/etc/wpa_supplicant/` and change the settings.

Execute the command bellow to connect
```
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
```