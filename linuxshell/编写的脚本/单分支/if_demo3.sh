#!/bin/bash
if ! mkdir "/media/cdrom"
then 
   echo "failed to create cdrom directory"
fi
if ! yum -y install ABC
then
  echo "failed to install soft"
fi
