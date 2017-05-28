#!/bin/bash

export SCRIPT_DIR=$(dirname "$0")

##
## Starts here
##

main ()
{
    build
}

##
## Build command with custom options for linker flags and swift compiler flags ex bridging headers
##

build ()
{

    # Adding linker flag to private frameworks
    # Specifying the required framework
    # Adding Objc bridging header

    swift build -Xlinker -v \
    -Xlinker -F/System/Library/PrivateFrameworks \
    -Xlinker -framework -Xlinker MobileDevice \
    -Xswiftc -import-objc-header -Xswiftc Sources/MayonFramework/Platform/Apple/mobiledevice/MobileDevice-Bridging-Header.h

}

export -f build

main
