//
//  StudioDto.swift
//  Emby.ApiClient
//

import Foundation

public struct StudioDto: Codable {
    let name: String
    let id: String
    let primaryImageTag: String?
    var hasPrimaryImage: Bool {
        get {
            return primaryImageTag != nil
        }
    }
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case id = "Id"
        case primaryImageTag = "PrimaryImageTag"
    }
}
