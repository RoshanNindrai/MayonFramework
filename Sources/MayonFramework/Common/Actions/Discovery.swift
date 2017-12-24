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

    init(_ option: DiscoveryOption,
         _ callback : @escaping DiscoveryCallback) {
        self.option = option
        self.callback = callback
    }

    /// Create a discovery command with default discovery option
    ///
    /// - Parameter callback: This method is called when the devices are identifed for that platform
    public init(_ callback : @escaping DiscoveryCallback) {
        self = Discovery.init(DiscoveryOption(platform: .iOS,
                                              timeout: MayonFramework.DefaultSetting.KDISCOVERYTIMEOUT), callback)
    }

    /// Create a discovery command with specific platform and timeout
    ///
    /// - Parameter callback: This method is called when the devices are identifed for that platform
    public init(_ platform: Platform,
                _ timeout: Double? = MayonFramework.DefaultSetting.KDISCOVERYTIMEOUT,
                _ callback : @escaping DiscoveryCallback) {
        self = Discovery.init(DiscoveryOption(platform: platform,
                                              timeout: timeout), callback)
    }

}

// MARK: - Operations
extension Discovery: Action {
    /// This method creates appropriate Device finder based on option and runs discovery
    public func run() {
        let finder = FinderFactory.finderFor(platform: option.platform)
        finder.find(option.timeout, callback)
    }
}
