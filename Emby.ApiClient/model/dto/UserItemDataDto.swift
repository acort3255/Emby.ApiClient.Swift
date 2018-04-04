//
//  UserItemDataDto.swift
//  Emby.ApiClient
//

import Foundation

public struct UserItemDataDto: Codable {
    var rating: Double?
    var playedPercentage: Double?
    var unplayedItemCount: Int?
    var playbackPositionTicks: Int?
    var playCount: Int?
    var isFavorite: Bool?
    var likes: Bool?
    var lastPlayedDate: Date?
    var played: Bool?
    var key: String?
    var itemId: String?
    
    enum CodingKeys: String, CodingKey
    {
        case rating = "Name"
        case playedPercentage = "PlayedPercentage"
        case unplayedItemCount = "UnplayedItemCount"
        case playbackPositionTicks = "PlaybackPositionTicks"
        case playCount = "PlayCount"
        case isFavorite = "IsFavorite"
        case likes = "Likes"
        case lastPlayedDate = "LastPlayedDate"
        case played = "Played"
        case key = "Key"
        case itemId = "ItemId"
    }
}
