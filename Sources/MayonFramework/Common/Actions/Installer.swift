//
//  Installer.swift
//  Mayon
//
//  Created by Roshan Nindrai on 12/24/17.
//

import Foundation

/// List of errors that are thrown during Installation
///
/// - invalidArtifact: This error is returned when an invalid artifact is given to us.
/// - failed: This error is returned when an error occurs in MobileDevice Realm
public enum InstallerError {
    case invalidArtifact(String)
    case failed(String)
}

// MARK: - Helpers
public extension InstallerError {
    /// Error message as raw string
    var message: String {
        switch self {
        case let .invalidArtifact(msg):
            return msg
        case let .failed(msg):
            return msg
        }
    }
}

/// Callback that is called when the installation action is called on a specific Platform
///
/// - failure: encapsulates the error object
/// - success: returned when the installation on the targeted device(s) is successful
public enum InstallationStatus {
    case failure(InstallerError)
    case success
}

public typealias InstallationCallback = (InstallationStatus) -> Void

/// The Installer Struct helps in installing a given application to a specific platform
public final class Installer {
    let artifact: Artifact
    let callback: InstallationCallback

    /// The installer that is spawed to install application on a specific device
    fileprivate var installer: InstallerProtocol?

    public init(_ artifact: Artifact, _ callback: @escaping InstallationCallback) {
        self.artifact = artifact
        self.callback = callback
    }

}

extension Installer: Action {
    public func run() {
        installer = InstallerFactory.installerFor(platform: artifact.platform)

        guard artifact.appPathCFURL.isValidPath else {
            let _error = """
            Application \(artifact.appPathCFURL) path is invalid,
            please provide a valid path to application file
            """
            callback(.failure(.invalidArtifact(_error)))
            return
        }

        installer?.install(artifact, callback)
    }
}
