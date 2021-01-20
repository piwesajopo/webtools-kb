# Installing and Configuring Dynamic IP using NoIP.com

### Make and Install:
```
wget https://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar vzxf noip-duc-linux.tar.gz
rm noip-duc-linux.tar.gz
cd noip-*
sudo make
sudo make install
```

When running the command **`sudo make install`** you will be asked for your noip.com mail and password, then it will ask the interval for IP update, default is 30 minutes, but you can set it as low as 5.

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

### Delivering Traffic to your Raspberry:

You are probably using your Raspberry at home if you are using a service like NoIP.com, therefore you will want to do additional configuration to deliver traffic from outside your network. Here are some steps you will need to perform:

#### Static IP Configuration

There are two ways you can achieve this:

* **On your router**

  Your modem/router probably allows specifying static IPs for a given MAC address. You can check your MAC address by using the command **`ifconfig wlan0`** or **`ifconfig eth0`** for Wi-Fi interface MAC address and Ethernet Interface MAC address respectively. The specific way to perform this configuration will vary according to your router brand, but it should be located along with other DHCP Options.
  
* **Configure on the Raspberry itself**

  It is recommended that you configure static IPs on your router, but if that's not an option, you can make specific configurations that only takes place when connecting to certain Wi-Fi networks. To achieve this, you need to modify your ***/etc/dhcpcd.conf*** file by adding an specific entry for each Wi-Fi network you may be connecting to inside your house.

  Let's say you want to add a configuration for SSID **my-cool-ssid** with the static IP **10.0.0.10**. You should add the following to the end of your ***/etc/dhcpcd.conf*** file:

```
# Example static IP configuration for specific ssid
#   In this example the Wi-Fi has the following configuration on the router
#     Subnet Mask:     255.255.255.0
#     Default Gateway: 192.168.0.1
ssid my-cool-ssid
static ip_address=192.168.0.10/24
#static ip6_address=fd51:42f8:caae:d92e::ff/64
static routers=192.168.0.1
static domain_name_servers=192.168.0.1
#static domain_name_servers=192.168.0.1 8.8.8.8 fd51:42f8:caae:d92e::1
```

#### Configure Port-Forwarding to your static IP address.

  After you have properly setup the static IP address, you must configure some port forwarding rules to your router. For example you may want to route incomming traffic from the internet for port 22 (SSH Service) to be delivered to your Raspberry Pi. The specific way to perform this configuration will vary according to your router brand, but it should be located under *Port Forwarding / Port Mapping options*.
  
#### Ensure proper IP resolution when connecting to the Raspberry from inside the same Wi-Fi Network.

  When connecting to your raspberry from a device that is connected to the same Network, your router may have some trouble delivering traffic to your raspberry. To avoid this, you can configure an static DNS for the **NoIP.com** hostname you have pointing to your router public IP. 
  
  For example you may wish to configure domain names **www.myNoIPsubdomain.ddns.net** and **myNoIPsubdomain.ddns.net** to resolve to static IP **192.168.1.10**.
  
