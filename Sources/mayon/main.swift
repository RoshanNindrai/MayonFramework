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
_ = commander.debugGo(with: """
                            mayon install -d 4f8053c5d21ee917e59cbe385d6817ba875dd8cb123
                            /Users/roshannindrai/Documents/sentinel/resources/ios/build/SNMATestDemo-MT.ipa
                            """)

CFRunLoopRun()
