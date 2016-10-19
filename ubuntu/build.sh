#!/bin/bash
platform='unknown'
unamestr=$(uname)

if [ "$unamestr" == 'Linux' ]; then
  if grep Ubuntu /etc/issue; then
    platform='Ubuntu'
  elif grep CentOS /etc/issue; then
    platform='CentOS'
  fi
elif [ "$unamestr" == 'Darwin' ]; then
   platform='macOS'
fi

packer_version="0.10.2"
packer_file="packer_${packer_version}_$(echo "$unamestr" | tr '[:upper:]' '[:lower:]')_amd64.zip"
packer_url="https://releases.hashicorp.com/packer/${packer_version}/${packer_file}"

if [ "$platform" == 'Ubuntu' ]; then 
  sudo apt -qy install wget zip p7zip-full
  command -v packer >/dev/null 2>&1 || wget $packer_url -P /tmp/ || sudo unzip -o /tmp/$packer_file -d /usr/local/bin
elif [ "$platform" == 'CentOS' ]; then
  sudo yum install -y wget zip p7zip
  command -v packer >/dev/null 2>&1 || wget $packer_url -P /tmp/ || sudo unzip -o /tmp/$packer_file -d /usr/local/bin
elif [ "$platform" == 'macOS' ]; then
  command -v brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install coreutils wget p7zip
  command -v packer >/dev/null 2>&1 || wget $packer_url -P /tmp/ || unzip -o /tmp/$packer_file -d /usr/local/bin
else
  echo "Unknown OS" >&2
  exit 1
fi

if [ "$unamestr" ==  'Darwin' ]; then
  command -v greadlink >/dev/null 2>&1 || brew install coreutils
  script=$(greadlink -f $0)
else
  script=$(readlink -f $0)
fi
BASEDIR=$(dirname $script)


function build_one() {
  if [ "$#" -ne 2 ]; then
  	echo "Usage: build_one name parent"
  	return
  fi
  name=$1
  parent=$2
  cd $BASEDIR

  rm images/$parent/
  7z x images/$parent.7z -oimages/
  cd packer-templates/
  packer build $name.json
  rm -rf ../images/$parent/

  unzip $name.zip
  rm $name.zip
  mv $name/ubuntu-16.04-desktop-amd64-*.vmdk $name/$name.vmdk
  if [ "$unamestr" ==  'Darwin' ]; then
  	sed -i '' "s/scsi0\:0\.filename.*/scsi0:0.filename = \"$name.vmdk\"/" $name/$name.vmx
  else
  	sed -i "s/scsi0\:0\.filename.*/scsi0:0.filename = \"$name.vmdk\"/" $name/$name.vmx
  fi
  7z a -t7z -m0=lzma2 -mmt=on -mx=9 -r $name.7z $name/
  rm -rf $name/
  mv $name.7z ../images/
  cd $BASEDIR
}


build_one "ubuntu-16.04-desktop-amd64" "ubuntu-16.04-desktop-amd64"
build_one "ubuntu-16.04-desktop-amd64-idea" "ubuntu-16.04-desktop-amd64"
build_one "ubuntu-16.04-desktop-amd64-pycharm" "ubuntu-16.04-desktop-amd64"
build_one "ubuntu-16.04-desktop-amd64-scala" "ubuntu-16.04-desktop-amd64-idea"
build_one "ubuntu-16.04-desktop-amd64-scrapy" "ubuntu-16.04-desktop-amd64-pycharm"
build_one "ubuntu-16.04-desktop-amd64-webstorm" "ubuntu-16.04-desktop-amd64"
build_one "ubuntu-16.04-desktop-amd64-algorithm" "ubuntu-16.04-desktop-amd64-idea"

