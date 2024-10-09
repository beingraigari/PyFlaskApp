sudo apt-get update

sudo apt-get install -y libfontconfig1 musl

wget https://dl.grafana.com/oss/release/grafana_10.4.1_amd64.deb

sudo dpkg -i grafana_10.4.1_amd64.deb

sudo /bin/systemctl daemon-reload

sudo /bin/systemctl enable grafana-server

sudo /bin/systemctl start grafana-server

sudo systemctl enable grafana-server.service



