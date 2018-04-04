//
//  ExternalUrl.swift
//  Emby.ApiClient
//

import Foundation

public struct ExternalUrl: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case url = "Url"
    }
}
