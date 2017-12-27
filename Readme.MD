# MayonFramework
[![Build Status](https://travis-ci.org/RoshanNindrai/Mayon.svg?branch=master)](https://travis-ci.org/RoshanNindrai/Mayon)

MayonFramework is a dynamic framework that can be used to talk with iOS devices. The framework uses the private MobileDevice.framework to communicate with devices. Due to the use of private framework within this framework, this is not suitable for publishing over Appstore. The framework is build to run on macOS 10.10 and above. As part of this project we are also building a mac cli tool called Mayon that is used as a playground to test MayonFramework functionality.

# Installation
TBD
# Usage

### Device

A Device protocol represents an actual Device that is currently connected to the machine. At present MayonFramework supports iOS device, Android device support will be added soon.

    /// Represents an actual mobile device
    public protocol Device: CustomStringConvertible {

        /// The id of the device
        var deviceId: String { get }

        /// The name of the device ex Roshan's iPhone
        var name: String { get }

        /// The platform Type of the device
        var platform: Platform { get }

        /// The os Version as string
        var version: String { get }

        /// The proxy to internal representation of device
        var proxy: Proxy? { get }
    }

### Actions

Actions are set of operations or functions that MayonFramework exposes to interact with devices at present MayonFramework supports the following actions

* [Discovery] - Action used to identify or list all the devices that are currently connected to the machine. As of today, Discovery supports only devices that is running iOS.

#### Discovery
The Discovery within MayonFramework enables the consumer to get the list of devices that is currently connect to the machine. The Discovery currently supports iOS, android support will be added soon. As part of the completion block a list of Device is returned. The devices shouldnt outlive the closure life time as it might result in un expected behaviour.

    import MayonFramework
    
    let discovery = Discovery(.iOS, timeo) { print($0) } // success([iOS: 'Roshan’s iPhone X' 4f8053c5d21ee917*********** 11.2.1])
    discovery.run()

Note: The discovery is one of the actions that is supported by MayonFramework and all actions are executed only when the run function is called.

# Prerequisite 
- Swift 4.0
- Mac with xcode 9.2 command line tools

# Info
  - Mayon currently supports iOS (7.0 and above)
  - written Swift 4.0
  - Recommended IDE Xcode 9.2
# Team

The following are the team members and their contact Information.
- Roshan Balaji (roshan.nindrai@gmail.com)

### Todos
 - Write Tests
 - Rethink Github Save
 
[Discovery]: (##Discovery)
