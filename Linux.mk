.PHONY: apt-get
apt-get:
	apt-get -y update
	apt-get -y install pipx
	pipx ensurepath
