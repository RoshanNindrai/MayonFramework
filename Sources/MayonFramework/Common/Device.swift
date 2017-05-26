//
//  Device.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// Represents an actual mobile device
public struct Device {

    /// The id of the device
    var uuid: UUID

    /// The name of the device ex Roshan's iPhone
    var name: String

    /// The platform Type of the device
    var platform: Platform

    /// The os Version as string
    var version: String
}
