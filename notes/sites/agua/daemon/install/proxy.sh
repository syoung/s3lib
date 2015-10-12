# install.sh

# 1. COPY FILES TO /etc

cd /home/vesi/proxy/daemon
sudo cp etc/init.d/proxy /etc/init.d
sudo cp etc/init/proxy.conf /etc/init
sudo cp etc/default/proxy /etc/default


# 2. COPY EXCUTEABLE TO /usr/bin

#ln -s /home/vesi/proxy/daemon/usr/bin/proxy /usr/bin/proxy
cp /home/vesi/proxy/daemon/usr/bin/proxy /usr/bin/proxy


# 3. RUN SERVICE

service proxy start

