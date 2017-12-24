//
//  DiscoveryOption.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// Model representing options that are provided duing Discovery Command
struct DiscoveryOption {

    /// The platform type we are targetting
    let platform: Platform

    /// Wait tme for discovery command to exit
    let timeout: Double

    public init(platform: Platform,
                timeout: Double?) {
        self.platform = platform
        self.timeout = timeout ?? DefaultSetting.KDISCOVERYTIMEOUT
    }
}
