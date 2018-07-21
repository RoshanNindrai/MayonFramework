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
                            mayon install /Users/roshannindrai/Documents/sentinel/resources/ios/build/Meanwhile.ipa
                            -d 3cfcbebf173c5074e1ff2db8f3851037593088b1
                            """)

CFRunLoopRun()
