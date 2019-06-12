## nslook

A simple nslookup software written in Perl. The PHP version of nslook can be
found in http://nslook.pynox.com.

## Pulling 

$ *sudo docker pull darcy95/nslook*

## Running (method 1)

$ *sudo docker run --rm darcy95/nslook perl nslook [domain] [qtype] [qclass]*

## Running (method 2: obtain the shell and run the script inside of a container)

$ *sudo docker run --rm -it darcy95/nslook /bin/bash*
*root@d919c8a229bd:/usr/src/nslook# perl nslook [domain] [qtype] [qclass]*

## Example

$ *sudo docker run --rm darcy95/nslook perl nslook pynox.com IN ANY*

## How to get the source code

$ *sudo docker run --rm -it darcy95/nslook /bin/bash*

or 

*git clone https://github.com/darcy95/nslook*
