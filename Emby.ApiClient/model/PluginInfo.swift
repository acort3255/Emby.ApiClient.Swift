//
//  PluginInfo.swift
//  EmbyApiClient
//

import Foundation

public struct PluginInfo: Codable {
    var name: String?
    var configurationDateLastModified: Date?
    var version: String?
    var assemblyFileName: String?
    var configurationFileName: String?
    var description: String?
    var id: String?
    var imageUrl: String?
    
    public init?(jSON: JSON_Object) {
        fatalError("init(jSON:) has not been implemented: \(jSON)")
    }
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case configurationDateLastModified = "ConfigurationDateLastModified"
        case version = "Version"
        case assemblyFileName = "AssemblyFileName"
        case configurationFileName = "ConfigurationFileName"
        case description = "Description"
        case id = "Id"
        case imageUrl = "ImageUrl"
    }
}
