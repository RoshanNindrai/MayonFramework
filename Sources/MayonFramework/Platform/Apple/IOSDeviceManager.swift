//
//  IOSDeviceManager.swift
//  Mayon
//
//  Created by Roshan Nindrai on 9/23/17.
//
//

import Foundation

struct IOSDeviceManager: DeviceProtocol {
    /// The methods that installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    func install(installer: ApplicationArtifact) {
        if case let ApplicationArtifact.iOS(devices, url) = installer {
            devices.forEach { print($0) }
            print(url)
        }
    }

    /// The methods that un-installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    func uninstall(installer: ApplicationArtifact) {
        return
    }

}
