//
//  AllFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/30/17.
//
//

import Foundation

final class AllFinder {
    var devices: [Device] = []
}

extension AllFinder: FinderProtocol {

    /// Runs platform specific code to find devices connected to the machine
    ///
    /// - Returns: A list of devices that was found for all platform type
    func find() -> [Device] {
        return devices
    }
}
