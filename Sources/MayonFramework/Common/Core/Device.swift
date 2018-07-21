//
//  Device.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

public enum Proxy {
    case iOS(AMDevicePointer)
}

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
    var proxy: Proxy { get }

}

extension Device {
    /// Device information within console
    public var description: String {
        return "\(platform): '\(name)' \(deviceId) \(version)"
    }
}
