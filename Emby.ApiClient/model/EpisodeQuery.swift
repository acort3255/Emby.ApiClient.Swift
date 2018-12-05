//
//  EpisodeQuery.swift
//  EmbyApiClient
//

import Foundation

public struct EpisodeQuery {
    public init() {}
    public var userId: String?
    public var seasonId: String?
    public var seriesId: String?
    public var isMissing: Bool?
    public var isVirtualUnaired: Bool?
    public var seasonNumber: Int?
    public var fields: [ItemFields]?
    public var startIndex: Int?
    public var limit: Int?
    public var startItemId: String?
    public var adjacentTo: String?
}
