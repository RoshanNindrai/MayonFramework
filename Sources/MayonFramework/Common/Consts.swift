//
//  Consts.swift
//  Mayon
//
//  Created by Roshan Nindrai on 7/16/17.
//
//

import Foundation

/// All default values can be hold within DefaultSetting
public struct DefaultSetting {
    /// The time in seconds used during device discpvery phase for each platform
    public static let KDISCOVERYTIMEOUT = 5.0
}

/// All default paths can be hold within Defaultpath
public struct Defaultpath {
    /// The path to ADB within mac osx
    public static let KADBPATH = "/usr/local/bin/adb"
}
