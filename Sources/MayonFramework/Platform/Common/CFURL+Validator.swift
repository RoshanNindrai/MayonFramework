//
//  CFURL+Validator.swift
//  Mayon
//
//  Created by Roshan Nindrai on 3/18/18.
//

import Foundation

extension CFURL {
    var isValidPath: Bool {
        let url: URL = (self as URL)
        let standardizedPath = (url.path as NSString).expandingTildeInPath
        return url.isFileURL && FileManager.default.fileExists(atPath: standardizedPath) &&
            (url.lastPathComponent.contains(".ipa") || url.lastPathComponent.contains(".apk"))
    }
}
