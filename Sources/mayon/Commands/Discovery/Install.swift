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

    /// The name of the command; used to route arguments to commands
    var name: String {
        return "install"
    }

    /// A short description of the Discovery Command
    var shortDescription: String {
        return "Install the application on specified deviceid or all devices given .ipa file"
    }

    let iOS = Flag("-i", "--ios", description: "Install the application on iOS device(s)")
    let android = Flag("-a", "--android", description: "Install the application on Android device(s)")

    var optionGroups: [OptionGroup] {
        let osType = OptionGroup(options: [iOS, android], restriction: .atMostOne)
        return [osType]
    }

}

// MARK: - Command conformance
extension Install: Command {

    /// Returns requested platform type from flags
    var platform: Platform {
        if iOS.value {
            return Platform.iOS
        } else {
            return Platform.default
        }
    }

    /// Executes the command
    ///
    /// - Throws: CLIError if command cannot execute successfully
    func execute() throws {

    }
}
