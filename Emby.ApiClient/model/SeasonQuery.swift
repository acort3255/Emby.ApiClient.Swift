//
//  EpisodeQuery.swift
//  EmbyApiClient
//

import Foundation

public struct SeasonQuery {
    public init() {}
    public var userId: String?
    public var seriesId: String?
    public var isMissing: Bool?
    public var isVirtualUnaired: Bool?
    public var fields: [ItemFields]?
    public var isSpecialSeason: Bool?
}



