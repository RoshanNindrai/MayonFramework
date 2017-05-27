//
//  Commander.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/25/17.
//
//

import Foundation
import SwiftCLI
import MayonFramework

struct Commander {

    var name = "mayon"

    var shortDescription: String = "A tool to perform Automated UITesting on Mobile devices"

    init() {
        CLI.setup(name: name, version: Version.current,
                  description: shortDescription)
    }

}

// MARK: - Helper methods
extension Commander {

    /// Register a list of commands that is supported by Mayon
    ///
    /// - Parameter commands: A swiftCLI Command to be registered
    func register(_ command: Command) {
        CLI.register(command: command)
    }

}
