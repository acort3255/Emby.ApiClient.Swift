//
//  SessionInfoDto.swift
//  EmbyApiClient
//

import Foundation

public struct SessionInfoDto : Codable {
      var supportedCommands = [String]()
      var queueableMediaTypes:[String]? = [String]()
      var playableMediaTypes = [String]()
      let id: String
      let userId: String
      let userPrimaryImageTag: String?
      let userName: String
//    var additionalUsers = [SessionUserInfo]()
      let applicationVersion: String
      let client: String
      var lastActivityDate = Date()
//    let nowViewingItem: BaseItemInfo
      let deviceName: String
//    let nowPlayingItem: BaseItemInfo
      let deviceId: String
      let appIconUrl: String?
      let supportsRemoteControl: Bool
      let playState: PlayerStateInfo
//    let transcodingInfo: TranscodingInfo
    
    public init?(jSON: JSON_Object) {
        /*print("**********************")
        print("QueueableMediaTypes: \(jSON["QueueableMediaTypes"] as? [String]?)")
        print("PlayableMediaTypes: \(jSON["PlayableMediaTypes"] as? [String])")
        print("DeviceId: \(jSON["DeviceId"] as? String)")
        print("SupportsRemoteControl: \(jSON["SupportsRemoteControl"] as? Int)")
        print("DeviceName: \(jSON["DeviceName"] as? String)")
        print("UserId: \(jSON["UserId"] as? String)")
        print("Id: \(jSON["Id"] as? String)")
        print("UserName: \(jSON["UserName"] as? String)")
        print("PlayState: \(PlayerStateInfo(jSON: (jSON["PlayState"] as? JSON_Object)!))")
        print("SupportedCommands: \(jSON["SupportedCommands"] as? String)")
        print("Client: \(jSON["Client"] as? String)")
        print("LastActivityDate: \(jSON["LastActivityDate"] as? String)")
        print("ApplicationVersion: \(jSON["ApplicationVersion"] as? String)")
        print("**********************")*/
        
        if  let queueableMediaTypes = jSON["QueueableMediaTypes"] as? [String]?,
            let playableMediaTypes = jSON["PlayableMediaTypes"] as? [String],
            let deviceId = jSON["DeviceId"] as? String,
            let supportsRemoteControl = jSON["SupportsRemoteControl"] as? Int,
            let userId = jSON["UserId"] as? String,
            let deviceName = jSON["DeviceName"] as? String,
            let id = jSON["Id"] as? String,
            let userName = jSON["UserName"] as? String,
            let playstateJSON = jSON["PlayState"] as? JSON_Object,
            let playState = PlayerStateInfo(jSON: playstateJSON),
            let supportedCommands = jSON["SupportedCommands"] as? [String],
            let client = jSON["Client"] as? String,
            let lastActivityDateString = jSON["LastActivityDate"] as? String,
            let applicationVersion = jSON["ApplicationVersion"] as? String
        {
            self.queueableMediaTypes = queueableMediaTypes
            self.playableMediaTypes = playableMediaTypes
            self.deviceId = deviceId
            self.appIconUrl = jSON["AppIconUrl"] as? String
            self.supportsRemoteControl = Bool(supportsRemoteControl)
            self.userId = userId
            self.userPrimaryImageTag = jSON["UserPrimaryImageTag"] as? String
            self.deviceName = deviceName
            self.id = id
            self.userName = userName
            self.playState = playState
            self.supportedCommands = supportedCommands
            self.client = client
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            self.lastActivityDate = formatter.date(from: lastActivityDateString)!
            self.applicationVersion = applicationVersion
            
            //MARK: TODO Additional Users
            //MARK: TODO Now Viewing Item
            //MARK: TODO Transcoding Info
        }
        else {
            return nil
        }
    }
    
    enum CodingKeys: String, CodingKey
    {
        case supportedCommands = "SupportedCommands"
        case queueableMediaTypes = "QueueableMediaTypes"
        case playableMediaTypes = "PlayableMediaTypes"
        case id = "Id"
        case userId = "UserId"
        case userPrimaryImageTag = "UserPrimaryImageTag"
        case userName = "UserName"
        //    var additionalUsers = [SessionUserInfo]()
        case applicationVersion = "ApplicationVersion"
        case client = "Client"
        case lastActivityDate = "LastActivityDate"
        //    let nowViewingItem: BaseItemInfo
        case deviceName = "DeviceName"
        //    let nowPlayingItem: BaseItemInfo
        case deviceId = "DeviceId"
        case appIconUrl = "AppIconUrl"
        case supportsRemoteControl = "SupportsRemoteControl"
        case playState = "PlayState"
        //    let transcodingInfo: TranscodingInfo
    }

}
