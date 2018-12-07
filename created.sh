#!/bin/bash

echo "Create Professor Directory"

read create
if echo $create | grep [http://*]
then

myvar=$create

if [ ! -d /tmp/$create/ ]; then
  mkdir -p /tmp/$create/;
fi

echo $create
fi
echo "CREATED.."
