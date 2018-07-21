//
//  IOSDevice.swift
//  Mayon
//
//  Created by Roshan Nindrai on 7/15/17.
//
//

import Foundation

public typealias AMDeviceRef = UnsafeMutablePointer<am_device_notification_callback_info>
public typealias AMDevicePointer = UnsafeMutablePointer<am_device>

// MARK: - IOS Device
struct IOSDevice: Device {

    /// The id of the device
    var deviceId: String

    /// The name of the device ex Roshan's iPhone
    var name: String

    /// The platform Type of the device
    var platform: Platform

    /// The os Version as string
    var version: String

    /// The proxy to internal representation of device
    var proxy: Proxy

    fileprivate var amDeviceRef: AMDeviceRef?

    /// Create a Device for iOS plaform
    ///
    /// - Parameter am_device: am_device instance that is used to get Device information
    init?(amdevice: AMDeviceRef?) {

        connect(amdevice); defer { disConnect(amdevice) }
        amDeviceRef = amdevice
        deviceId = (AMDeviceCopyDeviceIdentifier(amdevice!.pointee.dev).takeRetainedValue() as String)
        // This will return nil if the device was unplugged during discovery
        guard (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceName" as CFString) as? String) != nil else {
            print("Device \(deviceId) removed")
            return nil
        }

        name = (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceName" as CFString) as? String)!
        version =  (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "ProductVersion" as CFString) as? String)!
        platform = .iOS
        proxy = .iOS((amdevice?.pointee.dev)!)
    }

}

extension IOSDevice {

    /// Pointer to the device
    var amdevice: AMDevicePointer? {
        if case let .iOS(amdevice) = proxy {
            return amdevice
        }
        return nil
    }

    /// To execute any command, before exevuting the command
    /// the device connect call is made and will be disconnected at the end of execution
    ///
    /// - Parameter command: The command to be executed in the device
    func execute(_ command: (AMDevicePointer?) -> Void) {
        command(amDeviceRef?.pointee.dev)
    }

}

/// TO connect to a device to get information out of it
///
/// - Parameter device: The actual AMDevice reference
private func connect(_ device: AMDeviceRef?) {
    AMDeviceConnect(device!.pointee.dev)
    guard AMDeviceIsPaired(device!.pointee.dev) == 1 else {
        print("Please pair all the connected apple device(s)")
        disConnect(device)
        exit(1)
    }
}

/// TO disconnect from the device as part of cleanup
///
/// - Parameter device: The actual AMDevice reference
private func disConnect(_ device: AMDeviceRef?) {
    AMDeviceDisconnect(device!.pointee.dev)
}
