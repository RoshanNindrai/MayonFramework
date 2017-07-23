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

        guard FileManager.default.fileExists(atPath: Defaultpath.KADBPATH) else {
            print("ADB cannot be found at \(Defaultpath.KADBPATH)")
            exit(1)
        }

        let adbProcess = Process()
        adbProcess.launchPath = Defaultpath.KADBPATH
        adbProcess.arguments = ["devices", "-l"]
        adbProcess.launch()
        adbProcess.waitUntilExit()

    }
}
