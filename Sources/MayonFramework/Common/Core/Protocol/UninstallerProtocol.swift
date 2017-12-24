//
//  UninstallerProtocol.swift
//  MayonFramework
//
//  Created by Roshan Nindrai on 12/24/17.
//

import Foundation

/* All platform that support  uninstalling applications should conform to
 this protocol. The protocol defines methods to install and uninstall application
 */
public protocol UninstallerProtocol {
    /// The methods that un-installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    /// - Parameter callback: The completion block called with status of the un-installation operation
    func uninstall(_ installer: Artifact)
}
