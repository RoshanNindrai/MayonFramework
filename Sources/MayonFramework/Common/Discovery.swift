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
    let callback: DiscoveryCallback

    public init(_ option: DiscoveryOption,
                _ callback : @escaping DiscoveryCallback) {
        self.option = option
        self.callback = callback
    }

    /// Create a discovery command with default discovery option
    ///
    /// - Parameter callback: This method is called when the devices are identifed for that platform
    public init(_ callback : @escaping DiscoveryCallback) {
        self.option = DiscoveryOption(platform: .default,
                                      timeout: MayonFramework.DefaultSetting.KDISCOVERYTIMEOUT)
        self.callback = callback
    }

}

// MARK: - Operations
public extension Discovery {

    /// This method creates appropriate Device finder based on option and runs discovery
    func run() {
        let finder = FinderFactory.finderFor(platform: option.platform)
        finder.find(option.timeout, callback)
    }
}
