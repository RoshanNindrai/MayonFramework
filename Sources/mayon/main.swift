//
//  Main.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/24/17.
//
//
import Foundation
import SwiftCLI

// Register all the commands that were created to the CLI

let commander = Commander()
commander.register()
_ = CLI.debugGo(with: "mayon discover -i")

CFRunLoopRun()
