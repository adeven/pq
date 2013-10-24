#!/bin/sh

#
# $1 old reponame
#
FORK=`git remote show origin | grep "Fetch URL:" | awk '{print $3}' | awk -F 'https://' '{ print $2}'`
REPO=`git remote show origin | grep "Fetch URL:" | awk '{print $3}' | awk -F '/' '{ print $4}'`
ORIGIN="${FORK/$REPO/$1}"
/usr/bin/perl -p -i -e "s|$ORIGIN|$FORK|g" *
