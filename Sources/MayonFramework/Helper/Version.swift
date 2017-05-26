//
//  Version.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/25/17.
//
//

import Foundation

/// Contains Version related codes
public struct Version {

    /// The current version of the mayon cli read from Info.plist
    public static let current: String? = {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }()
}
