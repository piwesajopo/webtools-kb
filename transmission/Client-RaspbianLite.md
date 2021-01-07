# Install Transmission Torrent Client

## On a Raspberry Pi Running Raspbian-Lite

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
sudo mkdir -p /torrent/inprogress
sudo mkdir /torrent/complete
sudo mkdir /torrent/transmission-bk
sudo cp /etc/transmission-daemon/settings.json /torrent/transmission-bk
```

Let's see the user created for the service:
```
$ ls -l /etc/transmission-daemon/settings.json
-rw------- 1 debian-transmission debian-transmission 2389 Jan  6 11:51 /etc/transmission-daemon/settings.json
```

It looks the user is debian-transmission. Let's change the permissions:
```
sudo chown debian-transmission:debian-transmission /torrent
sudo chown debian-transmission:debian-transmission /torrent/inprogress
sudo chown debian-transmission:debian-transmission /torrent/complete
sudo chown debian-transmission:debian-transmission /torrent/transmission-bk
```

Make changes to file */etc/transmission-daemon/settings.json*:
```
    "download-dir": "/torrent/complete",
    "incomplete-dir": "/torrent/inprogress",
    "incomplete-dir-enabled": true,
    "rpc-username": "your-username",
    "rpc-password": "your-password",
```

