#!/usr/bin/env bash

pb ngrok/ngrok.sh
pb ix/ix.sh
pb rclone/login.sh
pb rclone/rclone.sh

if ! rlogin "$USERNAME" "$PASSWORD"; then
    echo "wrong password"
    exit 1
fi

ixlogin "$USERNAME" "$PASSWORD"

rungrok tcp 11753 &

while :; do
    sleep 20
    getgrok
    ixrun $(cat ngrokadress.txt)
    sleep 2m
done

cd OpenRCT2
while :; do
    rm -rf ~/world
    rdl ~/world
    ./openrct2-cli host ~/world/world.sv6
    sleep 10
    rupl ~/world
    sleep 4
done

echo "this message is not supposed to show up.
I think your server is f*cked now.
(you can try manually restarting, that usually does the trick)"
