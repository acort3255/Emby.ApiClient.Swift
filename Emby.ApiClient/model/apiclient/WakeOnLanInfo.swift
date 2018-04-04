//
//  WakeOnLanInfo.swift
//  Emby.ApiClient
//

import Foundation

public class WakeOnLanInfo: Codable {
    
    let macAddress: String
    let port: Int
    
    init(macAddress: String, port: Int = 0) {
        self.macAddress = macAddress
        self.port = port
    }
    
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey
    {
        case macAddress = "MacAddress"
        case port = "Port"
    }

}
