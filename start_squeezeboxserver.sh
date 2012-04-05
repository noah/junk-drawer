#!/bin/sh

# this works, at least for now

# version=7.5.2-31264
# version=-7.5.4-32171 
version=7.7.1-33735




cd /src/logitechmediaserver-$version
./slimserver.pl --user squeezeboxserver --daemon
