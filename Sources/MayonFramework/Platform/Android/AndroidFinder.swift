//
//  AndroidFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

final class AndroidFinder {
    var devices: [Device] = []
}

extension AndroidFinder: FinderProtocol {
    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double) {
        print(devices)
    }
}
