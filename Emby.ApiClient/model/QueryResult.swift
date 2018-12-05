//
//  QueryResult.swift
//  TestApp
//
//  Created by Angel Cortez on 4/4/18.
//

import Foundation

public struct QueryResult<T: Codable>: Codable{
    public init(items: [T]) {
        self.items = items
        self.totalRecordCount = items.count
    }
    
//    public init() {}
    public var items: [T]?
    public var totalRecordCount: Int
    
    enum CodingKeys: String, CodingKey
    {
        case items = "Items"
        case totalRecordCount = "TotalRecordCount"
    }
}
