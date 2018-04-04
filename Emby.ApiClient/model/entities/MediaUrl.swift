//
//  MediaUrl.swift
//  Emby.ApiClient
//

import Foundation

public struct MediaUrl: Codable {
    var url: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey
    {
        case url = "Url"
        case name = "Name"
    }
}
