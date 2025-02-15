#!/bin/sh
security find-generic-password -a keepass -w | /Applications/KeePassXC.app/Contents/MacOS/KeePassXC  --pw-stdin ~/Library/Mobile\ Documents/com\~apple\~CloudDocs//Passwords.kdbx

