//
//  NameIdPair.swift
//  Emby.ApiClient
//

import Foundation

public struct NameIdPair: Codable {
    let name: String
    let id: String
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case id = "Id"
    }
}
