# get-cpcert forked from kov-serg/get-cpcert

Console utility to convert cryptopro4 certificate (gost-2001, gost-2012) into pem file for openssl 1.1.1

## usage
<pre>
get-cpcert folder.000 password > certificate.pem
</pre>
## build 64bit
<pre>
Tested on ubuntu 14.04 LTS 64bit
Tested on xubuntu 14.04 LTS 64bit

prepare.sh -- download,build & install openssl 1.Tested on ubuntu 14.04 LTS 64bit1.1 & gost-engine + cmake
  it takes about 530Mb disk space and 20min to build on my notebook
  (365Mb cmake, 127Mb openssl, 6.8Mb engine)

build.sh -- build get-cpcert
  it outputs get-cpcert and libgost.so
 
</pre>

 
## build 32bit
<pre> 
  Tested on xbuntu 16.04 LTS 32bit
  
prepare_x32.sh -- download,build & install openssl 1.1.1 & gost-engin
   
</pre>

 
