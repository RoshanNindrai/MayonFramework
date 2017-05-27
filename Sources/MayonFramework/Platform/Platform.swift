//
//  Platform.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

/// List of platforms supported by mayon
///
/// - iOS: Represents the iOS platform
/// - android: Represents the Android platform
/// - all: Represents both iOS and Android platforms
public enum Platform: String {
    case iOS
    case android = "Android"
    case `default` = "All"
}
