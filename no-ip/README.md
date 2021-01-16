# Installing and Configuring Dynamic IP using NoIP.com

**Make and Install:**
```
wget https://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar vzxf noip-duc-linux.tar.gz
rm noip-duc-linux.tar.gz
cd noip-*
sudo make
sudo make install
```

When running the command **sudo make install** you will be asked for your noip.com mail and password, then it will ask the interval for IP update, default is 30 minutes, but you can set it as low as 5.

To run the service use:
```
sudo /usr/local/bin/noip2
```

To verify service is running properly and updated the IP:
```
sudo /usr/local/bin/noip2 -S
```

To make it load on system startup add the following lines to your **/etc/rc.local** file before the **exit 0** command:
```
# Run noip2 for ddns IP update
#su -l root -c /usr/local/bin/noip2
/usr/local/bin/noip2
```
