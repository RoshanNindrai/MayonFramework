//
//  InstallProtocol.swift
//  Mayon
//
//  Created by Roshan Nindrai on 9/23/17.
//
//

import Foundation

/* All platform that support installing, uninstalling applications should conform to
   this protocol. The protocol defines methods to install and uninstall application
 */
public protocol DeviceProtocol {

    /// The methods that installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    func install(installer: ApplicationArtifact)
    /// The methods that un-installs the application given the application artifact and devices
    ///
    /// - Parameter installer: The installer that contains the devices and the artifact to install
    func uninstall(installer: ApplicationArtifact)
}
