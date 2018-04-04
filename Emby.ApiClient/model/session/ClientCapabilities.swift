//
//  ClientCapabilities.swift
//  Emby.ApiClient
//

import Foundation

public struct ClientCapabilities: Codable {
    let playableMediaTypes: [String]?
    let supportedCommands: [String]?
    let supportsMediaControl: Bool?
    let messageCallbackUrl: String?
    let supportsContentUploading: Bool?
    let supportsPersistentIdentifier: Bool?
    let supportsSync: Bool?
    let supportsOfflineAccess: Bool?
//    let deviceProfile: DeviceProfile?
    let supportedLiveMediaTypes: [String]?
    let appStoreUrl: String?
    let iconUrl: String?
    
    public init() {
        playableMediaTypes = nil
        supportedCommands = nil
        supportsMediaControl = nil
        messageCallbackUrl = nil
        supportsContentUploading = nil
        supportsPersistentIdentifier = nil
        supportsSync = nil
        supportsOfflineAccess = nil
//        deviceProfile = nil
        supportedLiveMediaTypes = nil
        appStoreUrl = nil
        iconUrl = nil
    }
    
    enum CodingKeys: String, CodingKey
    {
        case playableMediaTypes = "PlayableMediaTypes"
        case supportedCommands = "SupportedCommands"
        case supportsMediaControl = "SupportsMediaControl"
        case messageCallbackUrl = "MessageCallbackUrl"
        case supportsContentUploading = "SupportsContentUploading"
        case supportsPersistentIdentifier = "SupportsPersistentIdentifier"
        case supportsSync = "SupportsSync"
        case supportsOfflineAccess = "supportsOfflineAccess"
//        case deviceProfile = "DeviceProfile"
        case supportedLiveMediaTypes = "SupportedLiveMediaTypes"
        case appStoreUrl = "AppStoreUrl"
        case iconUrl = "IconUrl"
    }

}
