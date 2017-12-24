//
//  Action.swift
//  MayonFramework
//
//  Created by Roshan Nindrai on 12/24/17.
//

import Foundation

/// All the actions that are provided by Mayon Framework should conform to this protocol
public protocol Action {
    /// Execute the operation that should be performed when the action is called by the client
    func run()
}
