# Dockerfile for universalresolver/driver-did-erc725

FROM maven:3-jdk-11
MAINTAINER Markus Sabadello <markus@danubetech.com>

USER root

ENV PATH $JAVA_HOME/bin:$PATH

# install dependencies

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:3.1.1:get -Dartifact=org.eclipse.jetty:jetty-maven-plugin:9.4.18.v20190429
RUN mvn org.apache.maven.plugins:maven-dependency-plugin:3.1.1:get -DrepoUrl=https://repo.maven.apache.org/maven2 -Dartifact=org.apache.maven.plugins:maven-war-plugin:3.2.2

# build driver-did-erc725

ADD . /opt/driver-did-erc725
RUN cd /opt/driver-did-erc725 && mvn clean install package -N -DskipTests

# variables

ENV uniresolver_driver_did_erc725_ethereumConnections=mainnet;hybrid;ropsten;hybrid;rinkeby;hybrid;kovan;hybrid
ENV uniresolver_driver_did_erc725_rpcUrls=mainnet;https://mainnet.infura.io/v3/fd9e225bc1234f49b48b295c611078eb;ropsten;https://ropsten.infura.io/v3/fd9e225bc1234f49b48b295c611078eb;rinkeby;https://rinkeby.infura.io/v3/fd9e225bc1234f49b48b295c611078eb;kovan;https://kovan.infura.io/v3/fd9e225bc1234f49b48b295c611078eb
ENV uniresolver_driver_did_erc725_etherscanApis=mainnet;http://api.etherscan.io/api;ropsten;http://api-ropsten.etherscan.io/api;rinkeby;http://api-rinkeby.etherscan.io/api;kovan;http://api-kovan.etherscan.io/api

# done

EXPOSE 8080

RUN chmod a+rx /opt/driver-did-erc725/docker/run-driver-did-erc725.sh
CMD "/opt/driver-did-erc725/docker/run-driver-did-erc725.sh"
