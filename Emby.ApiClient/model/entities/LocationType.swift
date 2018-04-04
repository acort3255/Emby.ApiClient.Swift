//
//  LocationType.swift
//  Emby.ApiClient
//

import Foundation

public enum LocationType: Int, Codable {
    case FileSystem = 0
    case Remote
    case Virtual
    case Offline
}
