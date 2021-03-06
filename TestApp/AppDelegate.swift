//
//  AppDelegate.swift
//  TestApp
//
//  Created by Vedran Ozir on 12/10/15.
//  Copyright © 2015 Vedran Ozir. All rights reserved.
//

import UIKit
import EmbyApiClient

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var connectionManager: ConnectionManager?
    
    let device = tvOSDevice()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let logger = Logger()
        let jsonSerializer = JsonSerializer()
        let httpClient = HttpClient(logger: logger, context: Context())
        let clientCapabilities = ClientCapabilities()
        let credentialProvider = CredentialProvider(jsonSerializer: jsonSerializer, filePath: "")
        let networkConnection = NetworkConnection()
        let serverDiscovery = ServerLocator(logger: logger, jsonSerializer: jsonSerializer)
        
        connectionManager = ConnectionManager(credentialProvider: credentialProvider,
            networkConnection: networkConnection,
            serverDiscovery: serverDiscovery,
            httpClient: httpClient,
            applicationName: "Emby_ApiClient",
            applicationVersion: "1.0",
            device: device,
            clientCapabilities: clientCapabilities)
        
        
        if  let nav = window?.rootViewController as? UINavigationController,
            let vc = nav.topViewController as? Startup,
            let connectionManager = connectionManager
        {
            vc.connectionManager = connectionManager
            print(connectionManager)
        }
        return true
    }
    
    
}

