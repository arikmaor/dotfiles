#!/bin/bash

ssh-keygen -t rsa -b 4096 -C $1 -P '' -f ~/.ssh/id_rsa
cp ssh_config_template ~/.ssh/config
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
