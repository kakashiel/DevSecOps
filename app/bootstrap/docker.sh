#!/usr/bin/env bash

if [ ! -x "$(command -v docker)" ]; then
  echo "-------------------------------"
  echo "INSTALL DOCKER"
  echo "-------------------------------"

  apt-get update

  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common\

    #install docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

  apt-get update

  apt-get install -y  docker-ce

  echo "-------------------------------"
  echo "CLEAN APT LIST AFTER INSTALL"
  echo "-------------------------------"

  rm -rf /var/lib/apt/lists/*

  echo "ADD PERMISSION TO ALL USER ACCESS DOCKER DAEMON"
  usermod -aG docker vagrant

  echo "ADD CONF DOCKER"
  conf="$(cat <<EOF
{
  "live-restore": true,
  "debug": false,
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "20m",
    "max-file": "2"
  },
  "insecure-registries" : ["registry-intermarche.local:5000"]
}
EOF
)"
   echo "$conf" > /etc/docker/daemon.json
   service docker restart

   echo "-------------------------------"
   echo "INSTALL DOCKER COMPOSE"
   echo "-------------------------------"

   curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
   chmod +x /usr/local/bin/docker-compose

   echo "-------------------------------"
   echo "EXPOSE API DOCKER"
   echo "-------------------------------"
   sed -i '/ExecStart/c\ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375' /lib/systemd/system/docker.service
   systemctl daemon-reload
   service docker restart

   # Say to docker the registry is valid
   cp -f /srv/app/Server/docker/docker /etc/default/


apt
echo "-------------------------------"
echo "CLEAN INACTIVE CONTAINER"
echo "-------------------------------"

pgrep -f docker > /dev/null || docker rm $(docker ps -aq) 0<&- &>/dev/null &

fi