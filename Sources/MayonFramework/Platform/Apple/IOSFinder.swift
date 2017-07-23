//
//  IOSFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

final class IOSFinder {
    var devices: [Device] = []
    let notificationPointer = UnsafeMutablePointer<UnsafeMutablePointer<am_device_notification>?>
        .allocate(capacity: MemoryLayout<am_device_notification>.stride)
}

extension IOSFinder: FinderProtocol {
    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double) {
        AMDeviceNotificationSubscribe({ (amdevice, _) in
            Locker.add(Device(amdevice: amdevice))
        }, 0, 0, 0, notificationPointer)
    }
}
