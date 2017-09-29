#!/usr/bin/bash
#
# Author: Sidharth Mishra <sidmishraw@gmail.com>
#
# Description: Creates a virtual environment for running Go workspace
#

if [ -z "$1" ]
then
  echo "Go workspace path not specified...Aborting...";
  exit 1;
fi

go_workspace="$1";
export GOPATH="$go_workspace";
export PS1="(gvenv) \w $ ";

echo "The Golang virtual environment is ready:: using GOPATH=$go_workspace";
