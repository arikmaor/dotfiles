# How to install the keyboard mapper

## Install Kmonad

1. Clone [kmonad repo](https://github.com/kmonad/kmonad)
1. Build the docker image: `docker build -t kmonad-builder .`
1. Get _kmonad_ executable from the built image: `docker run --rm -it -v ${PWD}:/host/ kmonad-builder bash -c 'cp -vp /root/.local/bin/kmonad /host/'`
1. Delete the image: `docker rmi kmonad-builder`
1. Move _kmonad_ to a location in your PATH: `sudo mv kmonad /usr/bin`

## Setup services

1. Create link to service file: `sudo ln -s $PWD/kmonad/KEYBOARD.service /etc/systemd/system/KEYBOARD.service`
1. Enable the service: `sudo systemctl enable KEYBOARD.service`
1. Start the service: `sudo systemctl start KEYBOARD.service`
