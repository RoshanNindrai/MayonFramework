//
//  Finder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

public final class Finder {

    let platform: Platform

    public init(platform: Platform) {
        self.platform = platform
    }
}

public extension Finder {
    func run() -> [Device] {

        switch platform {
        case .iOS:
            return IOSFinder().find()
        case .android:
            return AndroidFinder().find()
        default:
            return IOSFinder().find() + AndroidFinder().find()
        }

    }
}
