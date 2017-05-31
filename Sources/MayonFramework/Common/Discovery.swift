//
//  Discovery.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// Run appropriate dicovery based on discovery options
public struct Discovery {
    let option: DiscoveryOption

    public init(_ option: DiscoveryOption) {
        self.option = option
    }

}

// MARK: - Operations
public extension Discovery {

    /// This method creates appropriate Device finder based on option and runs discovery
    func run() -> [Device] {
        let finder = FinderFactory.finderFor(platform: option.platform)
        return finder.find()
    }
}
