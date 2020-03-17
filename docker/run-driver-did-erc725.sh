#!/bin/sh

cd /opt/driver-did-erc725/
mvn -settings settings.xml jetty:run -P war
