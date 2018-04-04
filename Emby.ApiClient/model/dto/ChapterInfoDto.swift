//
//  ChapterInfoDto.swift
//  Emby.ApiClient
//

import Foundation

public struct ChapterInfoDto: Codable {
    var startPositionTicks: Int
    var name: String
    var imageTag: String?
    var hasImage: Bool {
        get {
            return imageTag != nil
        }
    }
    
    init (name: String, startPositionTicks: Int) {
        self.name = name
        self.startPositionTicks = startPositionTicks
    }
    
    enum CodingKeys: String, CodingKey
    {
        case name = "Name"
        case startPositionTicks = "StartPositionTicks"
        case imageTag = "ImageTag"
    }
}
