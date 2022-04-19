#!/bin/bash

mv *.sh *.txt ~/Dump/
cd ~/Dump
chmod 777 
chmod 777 /root/Dump/*.sh
bash extract-files.sh || echo "BRUH: check your extract-files.sh. Might be something wrong with it." && exit 1
ls ../vendor/*/*
if [ -e ~/vendor/*/*/Android.bp ], then
 cd ../
 cd vendor/*/*
 git init && curl -s -X POST -H "Authorization: token ${GITHUB_TOKEN}" -d '{ "name": "'"${repo}"'"' "https://api.github.com/orgs/${GIT_ORG}/repos" } >/dev/null 2>&1
 git remote remove origin
 git remote add origin "https://github.com/"${GIT_ORG}"/"${repo}"
 git add --all
 git commit -asm "Blobs for umi"
 echo "Blobs extraction done!"
 exit 0
else
  echo "Blobs extraction failed" && exit 1
fi
