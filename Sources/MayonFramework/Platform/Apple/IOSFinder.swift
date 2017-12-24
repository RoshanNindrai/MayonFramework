//
//  IOSFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// The finder class used to find all connected iOS devices
final class IOSFinder {
    static var devices: [String:Device] = [:]
    let notificationPointer = UnsafeMutablePointer<UnsafeMutablePointer<am_device_notification>?>
        .allocate(capacity: MemoryLayout<am_device_notification>.stride)
}

// MARK: - FinderProtocol conformance
extension IOSFinder: FinderProtocol {
    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double, _ callback: @escaping DiscoveryCallback) {
        AMDeviceNotificationSubscribe({ (amdevice, _) in
            IOSFinder.add(IOSDevice(amdevice: amdevice))
        }, 0, 0, 0, notificationPointer)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 0) + timeout) {
            callback(.success(IOSFinder.deviceList()))
        }
    }
}
