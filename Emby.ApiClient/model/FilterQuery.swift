//
//  FilterQuery.swift
//  EmbyApiClient
//
//  Created by Angel Cortez on 3/13/19.
//

import Foundation

public class FilterQuery {
    public init() {}
    public var userId: String?
    public var parentId: String?
    public var includeItemTypes: [String]?
    public var mediaTypes: [String]?
}
