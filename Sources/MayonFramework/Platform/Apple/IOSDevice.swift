//
//  IOSDevice.swift
//  Mayon
//
//  Created by Roshan Nindrai on 7/15/17.
//
//

import Foundation

// MARK: - IOS Initializer
extension Device {
    /// Create a Device for iOS plaform
    ///
    /// - Parameter am_device: am_device instance that is used to get Device information
    init?(amdevice: UnsafeMutablePointer<am_device_notification_callback_info>?) {
        AMDeviceConnect(amdevice!.pointee.dev)
        uuid = (AMDeviceCopyDeviceIdentifier(amdevice!.pointee.dev).takeRetainedValue() as String)

        guard (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceName" as CFString) as? String) != nil else {
            print("Device \(uuid) removed")
            return nil
        }

        name = (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceName" as CFString) as? String)!
        version =  (AMDeviceCopyValue(amdevice!.pointee.dev, nil, "DeviceColor" as CFString) as? String)!
        platform = .iOS
        AMDeviceRelease(amdevice!.pointee.dev)
    }
}
