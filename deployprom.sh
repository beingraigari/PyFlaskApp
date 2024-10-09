echo "deleting old prom app"
sudo rm -rf Prometheus_Monitoring/


sudo kill -9 `sudo lsof /usr/local/bin/prometheus`



sudo git clone https://github.com/vipinkumar1234/Prometheus_Monitoring.git

cd Prometheus_Monitoring/

sudo ./install-prometheus.sh