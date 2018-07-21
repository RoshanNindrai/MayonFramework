//
//  Install.swift
//  Mayon
//
//  Created by Roshan Nindrai on 9/23/17.
//
//

import Foundation

import Foundation
import SwiftCLI
import MayonFramework

/// Command that helps to list all devices that are connected to the machine
final class Install {

    /// Installer used to run installer for a specific platform
    fileprivate var installer: Installer?

    /// The name of the command; used to route arguments to commands
    var name: String {
        return "install"
    }

    /// A short description of the Discovery Command
    var shortDescription: String {
        return "Install the application on specified deviceid or all devices given .ipa file"
    }

    let deviceID = Key<String>("-d", "--device_id",
                               description: "Install application on a specific device with device_id")
    let applicationPath = Parameter()

}

// MARK: - Command conformance
extension Install: Command {

    /// Returns requested platform type from flags
    var platform: Platform {
        return Platform.iOS
    }

    /// Executes the command
    ///
    /// - Throws: CLIError if command cannot execute successfully
    func execute() throws {
        let devices = deviceID.value != nil ? [deviceID.value!]: nil
        installer = Installer(.iOS(devices, URL(fileURLWithPath: self.applicationPath.value))) { status in
            switch status {
            case let .failure(failure):
                print(failure.message)
                exit(1)
            default:
                print("Installation Completed")
                exit(0)
            }
        }
        installer?.run()
    }
}
