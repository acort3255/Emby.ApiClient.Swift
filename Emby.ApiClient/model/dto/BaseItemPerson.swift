//
//  BaseItemPersonDto.swift
//  Emby.ApiClient
//

import Foundation

public class BaseItemPerson: Codable {
    public let name: String
    public var id: String?
    public let role: String?
    public let type: String
    public var primaryImageTag: String?
    public var hasPrimaryImage: Bool {
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
