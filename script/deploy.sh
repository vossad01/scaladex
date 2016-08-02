#!/bin/bash

if [ "`git rev-parse --abbrev-ref HEAD`" -eq "master" ];
then

source $(dirname $0)/base.sh

export JVM_OPTS="-Xms1G -Xmx2G -XX:ReservedCodeCacheSize=256m -XX:+TieredCompilation -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC"
./sbt ";clean ;server/universal:packageBin"

cp server/target/universal/server-0.1.3.zip

fi