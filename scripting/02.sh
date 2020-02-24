#!/bin/bash
USER=$1
sudo usermod --expiredate 1 $USER
sudo killall -KILL -u $USER
crontab -r -u $USER
sudo userdel -r $USER
unset USER
