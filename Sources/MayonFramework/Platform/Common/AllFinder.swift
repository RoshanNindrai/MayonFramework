//
//  AllFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/30/17.
//
//

import Foundation

final class AllFinder {
   static var devices: [String:Device] = [:]
}

extension AllFinder: FinderProtocol {
    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double, _ callback: @escaping DiscoveryCallback) {
        let iosFinder = IOSFinder()
        iosFinder.find(timeout, callback)
    }
}
