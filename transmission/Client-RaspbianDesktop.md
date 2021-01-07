# Installing Transmission Torrent Client on Raspberry Pi

### Update apt
```
sudo apt update
sudo apt upgrade
```

### Install Transmission Daemon
```
sudo apt install transmission-daemon
sudo systemctl stop transmission-daemon
```

### Connect media device and create folders

Create Folders:
```
sudo mkdir -p /media/pi/NASHDD/torrent-inprogress
sudo mkdir -p /media/pi/NASHDD/torrent-complete
sudo mkdir /media/pi/NASHDD/transmission-bk
```

Let's see the user created for the service:
```
$ ls -l /etc/transmission-daemon/settings.json
-rw------- 1 debian-transmission debian-transmission 2389 Jan  6 11:51 /etc/transmission-daemon/settings.json
```

It looks the user is debian-transmission. Let's change the permissions:
```
sudo chown debian-transmission:debian-transmission /media/pi/NASHDD/torrent-inprogress
sudo chown debian-transmission:debian-transmission /media/pi/NASHDD/torrent-complete
sudo chown pi:pi /media/pi/NASHDD/transmission-bk
```

....
....
....
