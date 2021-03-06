//
//  ImageOrientation.swift
//  Emby.ApiClient
//

import Foundation

public enum ImageOrientation: Int, Codable {
    case TopLeft = 1
    case TopRight
    case BottomRight
    case BottomLeft
    case LeftTop
    case RightTop
    case RightBottom
    case LeftBottom
}
