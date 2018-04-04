//
//  BaseItemPersonDto.swift
//  Emby.ApiClient
//

import Foundation

public class BaseItemPerson: Codable {
    let name: String
    var id: String?
    let role: String
    let type: String
    var primaryImageTag: String?
    var hasPrimaryImage: Bool {
        get {
            return primaryImageTag != nil
        }
    }
    
    init (name: String, role: String, type: String) {
        self.name = name
        self.role = role
        self.type = type
    }
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case id = "Id"
        case role = "Role"
        case type = "Type"
        case primaryImageTag = "PrimaryImageTag"
    }
}
