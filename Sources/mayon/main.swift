//
//  Main.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/24/17.
//
//

import SwiftCLI

// Register all the commands that were created to the CLI

let commander = Commander()
commander.register(Discovery())

_ = CLI.debugGo(with: "mayon version")