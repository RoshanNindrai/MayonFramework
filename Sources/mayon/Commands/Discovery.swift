//
//  Discovery.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/25/17.
//
//

import Foundation
import SwiftCLI

/// Command that helps to list all devices that are connected to the machine
class Discovery: Command {

    /// The name of the command; used to route arguments to commands
    var name: String {
        return "discover"
    }

    /// A short description of the Discovery Command
    var shortDescription: String {
        return "List all the devices that are connected"
    }

    /// Executes the command
    ///
    /// - Throws: CLIError if command cannot execute successfully
    func execute() throws {
        print("Discover Called")
    }

}
