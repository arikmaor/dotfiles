# How to install the keyboard mapper

## Install Kmonad

1. Clone [kmonad repo](https://github.com/kmonad/kmonad)
1. Build the docker image: `docker build -t kmonad-builder .`
1. Get _kmonad_ executable from the built image: `docker run --rm -it -v ${PWD}:/host/ kmonad-builder bash -c 'cp -vp /root/.local/bin/kmonad /host/'`
1. Delete the image: `docker rmi kmonad-builder`
1. Move _kmonad_ to a location in your PATH: `sudo mv kmonad /usr/bin`

## Setup services

1. Copy the wanted service files: `sudo cp $PWD/kmonad/KEYBOARD.service /etc/systemd/system`
1. Reload systemd daemon: `sudo systemctl daemon-reload`
1. Start the services: `sudo systemctl start KEYBOARD.service`
1. Enable the services: `sudo systemctl enable KEYBOARD.service`
