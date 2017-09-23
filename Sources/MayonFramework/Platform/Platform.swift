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
/// - defailt: Represents the default Platform which is currently iOS
/// - iOS: Represents the iOS platform
public enum Platform: String {
    case `default`
    case iOS
}

/// Installer that defines installer for each platform
///
/// - iOS: The installer type for iOS
public enum ApplicationArtifact {
    case iOS([Device], URL)
}
