#!/bin/bash
export SKYPEUSER=$(cat credentials | awk '{print $1}')
export SKYPEPASS=$(cat credentials | awk '{print $2}')
echo $SKYPEUSER $SKYPEPASS | skype --pipelogin
