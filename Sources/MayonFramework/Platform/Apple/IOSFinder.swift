//
//  IOSFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

class IOSFinder {
    var devices: [Device] = []
}

extension IOSFinder: FinderProtocol {

    /// Runs platform specific code to find devices connected to the machine
    ///
    /// - Returns: A list of devices that was found for that specific platform type
    func find() -> [Device] {
        print("IOSFinder called")
        return devices
    }
}
