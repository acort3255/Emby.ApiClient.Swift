//
//  NextUpQuery.swift
//  Emby.ApiClient
//

import Foundation

public struct NextUpQuery {
    public init() {}
    public var userId: String?
    public var parentId: String?
    public var seriesId: String?
    public var startIndex: Int?
    public var limit: Int?
    public var fields: [ItemFields]?
    public var enableImages: Bool?
    public var imageTypeLimit: Int?
    public var enableImageTypes: [ImageType]?
}
