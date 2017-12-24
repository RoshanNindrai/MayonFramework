//
//  IOSInstaller.swift
//  MayonFramework
//
//  Created by Roshan Nindrai on 12/24/17.
//

import Foundation

/// Class that handles all the installation operations with respect to iOS
final class IOSInstaller: InstallerProtocol {
    /// The methods that installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    /// - Parameter callback: The completion block called with status of the installtion operation
    func install(_ artifact: Artifact, _ callback: @escaping InstallationCallback) {

        let discovery = Discovery(.iOS) { _ in
            if case let .iOS(devices, _) = artifact {
                let targetDevices = devices != nil ? devices! : Array(IOSFinder.devices.keys)
                guard !targetDevices.isEmpty else { callback(.failure(.failed("IOS: No devices found with criteria")))
                                                    exit(0)}
                print(targetDevices)
                callback(.success)
            } else {
                callback(.failure(.invalidArtifact("Invalid artifact to IOSInstaller")))
            }
        }
        discovery.run()
    }
}
