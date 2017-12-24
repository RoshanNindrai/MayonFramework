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
    fileprivate let cli: CLI
    var shortDescription: String = "A tool to perform Automated UITesting on Mobile devices"

    init() {
        cli = CLI(name: name, version: Version.current,
                  description: shortDescription, commands: [Discover(), Install()])
    }
}

extension Commander {

    /// Forward the debugGo command to the internal cli object
    ///
    /// - Parameter with: The actual debug command to execute
    func debugGo(with: String) -> Int32 {
        return cli.debugGo(with: with)
    }
}
