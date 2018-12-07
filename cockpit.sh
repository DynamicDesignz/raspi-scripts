sudo add-apt-repository ppa:cockpit-project/cockpit
sudo apt-get update
sudo apt-get -y install cockpit
sudo systemctl enable --now cockpit.socket

