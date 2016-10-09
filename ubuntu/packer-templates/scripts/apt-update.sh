#!/bin/bash
echo "#################### sudo apt -qy update ####################"
echo "waiting for apt lock to finish"
while [ -f /var/lib/dpkg/lock ]
  do
  printf "."
  sleep 5
done
echo "apt lock gone, proceeding."

sudo apt -qy update

