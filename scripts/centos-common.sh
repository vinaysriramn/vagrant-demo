#!/bin/bash

#update centos with any patches
yum update -y --exclude=kernel
#tools
yum install -y nano git unzip screen nc telnet