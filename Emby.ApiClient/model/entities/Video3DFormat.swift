//
//  Video3DFormat.swift
//  Emby.ApiClient
//

import Foundation

public enum Video3DFormat: Int, Codable {
    case HalfSideBySide
    case FullSideBySide
    case FullTopAndBottom
    case HalfTopAndBottom
}
