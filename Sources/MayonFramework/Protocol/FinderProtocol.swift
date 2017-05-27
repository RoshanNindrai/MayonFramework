//
//  FinderProtocol.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// All the platform Finder types should conform to this protocol
public protocol FinderProtocol : class {

    var devices: [Device] { get }

    /// Runs platform specific code to find devices connected to the machine
    ///
    /// - Returns: A list of devices that was found for that specific platform type
    func find() -> [Device]
}
