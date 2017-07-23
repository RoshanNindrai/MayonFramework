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
    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double) {
        IOSFinder().find(timeout)
        AndroidFinder().find(timeout)
    }
}
