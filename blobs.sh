#!/bin/bash

mv *.sh *.txt ~/Dump/
cd ~/Dump
chmod 777 .
chmod 777 /root/Dump/*.sh
bash extract-files.sh
ls ../vendor/*/*
 echo "Blobs extraction done"
 cd ..
 cd vendor/*/
tar -cf "$(ls)".tar.gz "$(ls)"
transter wet ./*.tar.gz
curl -T ./*.tar.gz https://oahi.at 2>/dev/null
