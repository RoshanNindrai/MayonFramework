//
//  Locker.swift
//  Mayon
//
//  Created by Roshan Nindrai on 7/16/17.
//
//

import Foundation

/// Contains all the devices that were identified in memory
public final class Locker {
    fileprivate static var devices: [String : Device] = [:]
}

// MARK: - Helper Methods
public extension Locker {

    /// To add a device to a list of saved devices
    ///
    /// - Parameter device: The actual device that needs to be saved
    static func add(_ device: Device?) {
        guard device != nil else { return }
        devices[device!.uuid] = device!
    }

    /// To add a device to a list of saved devices
    ///
    /// - Parameter device: The actual device that needs to be saved
    static func removed(_ device: Device) {
        guard devices[device.uuid] != nil else { return }
        devices.removeValue(forKey: device.uuid)
    }

    /// Print all the devices that were identified during discovery
    static func printList() {
        devices.forEach { print($0.value) }
    }

    /// All the devices that were identified during discovery
    ///
    /// - Returns: A list of identified devices
    static func deviceList() -> [Device] {
            return Array(devices.values)
    }

}
