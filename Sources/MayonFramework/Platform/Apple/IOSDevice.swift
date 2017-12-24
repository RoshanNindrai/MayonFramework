//
//  IOSDevice.swift
//  Mayon
//
//  Created by Roshan Nindrai on 7/15/17.
//
//

import Foundation

typealias AMDeviceRef = UnsafeMutablePointer<am_device_notification_callback_info>

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
    var proxy: Proxy?

    /// Create a Device for iOS plaform
    ///
    /// - Parameter am_device: am_device instance that is used to get Device information
    init?(amdevice: AMDeviceRef?) {

        connect(amdevice); defer { disConnect(amdevice) }

        deviceId = (AMDeviceCopyDeviceIdentifier(amdevice!.pointee.dev).takeRetainedValue() as String)
        // This will return nil if the device was unplugged during discovery
        guard (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceName" as CFString) as? String) != nil else {
            print("Device \(deviceId) removed")
            return nil
        }

        name = (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceName" as CFString) as? String)!
        version =  (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "ProductVersion" as CFString) as? String)!
        platform = .iOS
        proxy = .iOS((amdevice?.pointee.dev.pointee)!)
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
    AMDeviceRelease(device!.pointee.dev)
}
