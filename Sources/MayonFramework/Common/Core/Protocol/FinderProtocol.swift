//
//  FinderProtocol.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// enum that encapsulates the response from Platform finders
///
/// - success: Holds the list of devices that was found during discovery
/// - failure: Error that was experienced during discovery
public enum FinderResponse {
    case success([Device])
    case failure(Error)
}

// MARK: - Types
public typealias DeviceRack = [String:Device]
public typealias DiscoveryCallback = (FinderResponse) -> Void

/// All the platform Finder types should conform to this protocol
public protocol FinderProtocol: class {

    static var devices: DeviceRack { get set }

    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double,
              _ callback: @escaping DiscoveryCallback)

}

// MARK: - Helper Methods
public extension FinderProtocol {

    /// To add a device to a list of saved devices
    ///
    /// - Parameter device: The actual device that needs to be saved
    static func add(_ device: Device?) {
        guard device != nil else { return }
        devices[device!.deviceId] = device!
    }

    /// To remove a device to a list of saved devices
    ///
    /// - Parameter device: The actual device that needs to be saved
    static func remove(_ device: Device) {
        guard devices[device.deviceId] != nil else { return }
        devices.removeValue(forKey: device.deviceId)
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
