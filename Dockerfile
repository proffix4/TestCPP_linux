FROM ubuntu AS build

RUN apt-get update && \
	apt-get install -y build-essential git cmake autoconf libtool pkg-config

WORKDIR /src

COPY CMakeLists.txt main.cpp ./

RUN cmake . && make

FROM ubuntu

WORKDIR /opt/TestCPP_linux

COPY --from=build /src/TestCPP_linux_demo ./

CMD ["./TestCPP_linux_demo"]