if [ -z $2 ] ; then
        echo
        echo "Sintax: $0 <SSID> <STATIC_IP>"
        echo
        exit
fi

echo
echo "# Static IP configuration for SSID $1:"
echo "ssid $1"
echo "static ip_address=${2}/24"
echo "static routers=`ip r | grep default | awk '{print $3}'`"
echo "static domain_name_servers=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`"
