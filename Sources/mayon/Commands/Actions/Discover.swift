//
//  Discover.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/25/17.
//
//

import Foundation
import SwiftCLI
import MayonFramework

/// Command that helps to list all devices that are connected to the machine
final class Discover {

    /// The name of the command; used to route arguments to commands
    var name: String {
        return "discover"
    }

    /// A short description of the Discovery Command
    var shortDescription: String {
        return "List all the iOS devices that are connected"
    }

    let timeout = OptionalParameter()
}

// MARK: - Command conformance
extension Discover: Command {

    /// Returns requested platform type from flags
    var platform: Platform {
        return Platform.iOS
    }

    /// Executes the command
    ///
    /// - Throws: CLIError if command cannot execute successfully
    func execute() throws {
        let timeo = timeout.value != nil ? Double(timeout.value!) : nil
        print("Running Discovery for \(platform) ...")
        let discovery = Discovery(.iOS, timeo) {
            print($0)
            exit(0)
        }
        discovery.run()
    }
}
