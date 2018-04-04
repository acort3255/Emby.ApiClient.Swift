//
//  PlayMethod.swift
//  EmbyApiClient
//

import Foundation

public enum PlayMethod: Int, Codable {
    case Transcode
    case DirectStream
    case DirectPlay
}
