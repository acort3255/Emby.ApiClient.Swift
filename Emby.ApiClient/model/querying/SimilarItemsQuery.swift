//
//  SimilarItemsQuery.swift
//  Emby.ApiClient
//

import Foundation

public struct SimilarItemsQuery {
    public init() {}
    public var userId: String?
    public var id: String?
    public var limit: Int?
    public var fields: [ItemFields]?
}
