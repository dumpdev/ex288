#!/bin/bash
oc login -u developer -p developer > /dev/null 2>&1

oc delete project zenpe gocin jonson japan openin acid > /dev/null 2>&1

echo -ne '#####                     (33%)\r'
sleep 20

oc new-project openin > /dev/null 2>&1

oc new-app --name=ziner --as-deployment-config php:7.3~https://github.com/ex288-user/ex288-postcomm.git > /dev/null 2>&1

echo -ne '#############             (66%)\r'
sleep 15

cd ~/ex288-scripts/mygit-repo > /dev/null 2>&1

cd ex288-s2i/

git push -f > /dev/null 2>&1

cd ../

cd ex288-nodejs-app/

git push -f > /dev/null 2>&1

cd ../
cd ex288-containerimage/

git push -f > /dev/null 2>&1

podman rmi -af > /dev/null 2>&1

rm ~/ex288-template.yaml > /dev/null 2>&1
rm -rf ~/git* > /dev/null 2>&1

oc logout > /dev/null 2>&1
echo -ne '##########################(100%)\n'

