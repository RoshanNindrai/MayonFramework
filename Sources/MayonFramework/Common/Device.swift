//
//  Device.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

public enum Proxy {
    case iOS(am_device)
}

/// Represents an actual mobile device
public struct Device {

    /// The id of the device
    var uuid: String

    /// The name of the device ex Roshan's iPhone
    var name: String

    /// The platform Type of the device
    var platform: Platform

    /// The os Version as string
    var version: String

    /// The proxy to internal representation of device
    var proxy: Proxy?

}

// MARK: - CustomStringConvertible conformance
extension Device: CustomStringConvertible {
    /// Device information within console
    public var description: String {
        return "\(platform): '\(name)' \(uuid)"
    }
}
