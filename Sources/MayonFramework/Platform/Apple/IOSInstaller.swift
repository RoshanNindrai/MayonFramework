//
//  IOSInstaller.swift
//  MayonFramework
//
//  Created by Roshan Nindrai on 12/24/17.
//

import Foundation

/// Class that handles all the installation operations with respect to iOS
final class IOSInstaller: InstallerProtocol {

    /// To run discovery command as to get all devices that is currently connected to mac
    private var discovery: Discovery?

    /// The methods that installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    /// - Parameter callback: The completion block called with status of the installtion operation
    func install(_ artifact: Artifact, _ callback: @escaping InstallationCallback) {

        discovery = Discovery(.iOS) { [unowned self] _ in
            if case let .iOS(devices, _) = artifact {
                let targetDevices = devices != nil ? devices! : Array(IOSFinder.devices.keys)
                let devices = IOSFinder.devices
                guard !targetDevices.isEmpty && !devices.isEmpty else {
                    callback(.failure(.failed("IOS: No devices found with criteria")))
                    return
                }
                targetDevices.forEach {
                    if devices.keys.contains($0) {
                        self._install(IOSFinder.devices[$0] as? IOSDevice, artifact)
                    }
                }
                callback(.success)
            } else {
                callback(.failure(.invalidArtifact("Invalid artifact to IOSInstaller")))
            }
        }
        discovery?.run()
    }

    private func _install(_ device: IOSDevice?, _ artifact: Artifact) {

        guard case .iOS = artifact else {
            fatalError("IOS installer called for different platform")
        }

        device?.execute { pointer in
            AMDevicePair(pointer)
            validate(AMDeviceValidatePairing(pointer))
        }
    }

}
