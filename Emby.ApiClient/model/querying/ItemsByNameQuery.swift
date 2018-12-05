//
//  ItemsByNameQuery.swift
//  Emby.ApiClient
//

import Foundation

public class ItemsByNameQuery {
    public init() {}
    public var userId: String?
    public var startIndex: Int?
    public var limit: Int?
    public var recursive: Bool? = true
    public var sortOrder: SortOrder?
    public var parentId: String?
    public var fields: [ItemFields]?
    public var filters: [ItemFilter]?
    public var excludeItemTypes: [String]?
    public var includeItemTypes: [String]?
    public var mediaTypes: [String]?
    public var sortBy: [String]?
    public var imageTypes: [ImageType]?
    public var nameStartsWithOrGreater: String?
    public var nameStartsWith: String?
    public var nameLessThan: String?
    public var isPlayed: Bool?
    public var enableImages: Bool?
    public var imageTypeLimit: Int?
    public var enableImageTypes: [ImageType]?
}
