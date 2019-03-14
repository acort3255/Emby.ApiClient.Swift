//
//  FilterItem.swift
//  TestApp
//
//  Created by Angel Cortez on 3/13/19.
//

import Foundation

public class FilterItem: Codable {
    public var genres: [String]?
    public var officalRatings: [String]?
    public var tags: [String]?
    public var years: [Int]?
    
    enum CodingKeys: String, CodingKey
    {
        case genres = "Genres"
        case officalRatings = "OfficialRatings"
        case tags = "Tags"
        case years = "Years"
    }
}
