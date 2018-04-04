//
//  ProgramAudio.swift
//  Emby.ApiClient
//

import Foundation

public enum ProgramAudio: Int, Codable {
    case Mono
    case Stereo
    case Dolby
    case DolbyDigital
    case Thx
}
