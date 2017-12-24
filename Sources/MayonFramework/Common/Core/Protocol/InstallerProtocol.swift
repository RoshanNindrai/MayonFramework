//
//  InstallProtocol.swift
//  Mayon
//
//  Created by Roshan Nindrai on 9/23/17.
//
//

import Foundation

/* All platform that support installing applications should conform to
 this protocol. The protocol defines methods to install and uninstall application
 */
public protocol InstallerProtocol {
    /// The methods that installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    /// - Parameter callback: The completion block called with status of the installation operation
    func install(_ artifact: Artifact, _ callback: @escaping InstallationCallback)
}
