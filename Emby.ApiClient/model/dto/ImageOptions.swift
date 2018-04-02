//
//  ImageOptions.swift
//  Emby.ApiClient
//

import Foundation

public struct ImageOptions {
    public init() {}
    public var imageType: ImageType = .Primary
    public var imageIndex: Int?
    public var width: Int?
    public var height: Int?
    public var maxWidth: Int?
    public var maxHeight: Int?
    public var quality: Int?
    public var tag: String?
    public var cropWhiteSpace: Bool?
    public var enableImageEnhancers = true
    public var imageFormat: ImageFormat?
    public var addPlayedIndicator: Bool?
    public var percentPlayed: Int?
    public var unplayedCount: Int?
    public var backgroundColor: String?
}
