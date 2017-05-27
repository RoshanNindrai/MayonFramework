//
//  CommandBus.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

final class CommandBus {

    static let main = { DispatchQueue.main }()

    /// A queue that is used to run all discovery Async Tasks
    static let discoveryQueue: DispatchQueue = {
        DispatchQueue(label: "com.uniqlabs.mayon.discoveryQueue",
                      qos: .userInteractive,
                      target: .global(qos: .userInteractive)
        )
    }()

    /// A queue that is used to hold all print queries
    static let printerQueue: DispatchQueue = {
        DispatchQueue(label: "com.uniqlabs.mayon.printerQueue",
                      qos: .userInteractive,
                      target: .global(qos: .userInteractive)
        )
    }()

}
