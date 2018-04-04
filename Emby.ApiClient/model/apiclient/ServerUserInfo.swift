//
//  ServerUserInfo.swift
//  Emby.ApiClient
//

import Foundation

public class ServerUserInfo: Codable, Equatable, Hashable {
    public var hashValue: Int = 0
    {
        didSet{
            hashValue = id.hashValue
        }
    }
    
    
    public init(id: String, isSignedInOffline: Bool)
    {
        self.id = id
        self.isSignedInOffline = isSignedInOffline
    }
    
    var id: String = ""
    var isSignedInOffline: Bool = false
    
    enum CodingKeys: String, CodingKey
    {
        case id = "Id"
        case isSignedInOffline = "IsSignedInOffline"
    }

    
    // MARK: NSObject
    
    /*override public func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? ServerUserInfo {
            return id == rhs.id
        }
        return false
    }*/
    
    // MARK: NSCoding
    
//    public required convenience init?(coder aDecoder: NSCoder) {
//        guard let id = aDecoder.decodeObject(forKey: "id") as? String
//            else {
//                return nil
//        }
//
//        self.init(id: id, isSignedInOffline: aDecoder.decodeBool(forKey: "isSignedInOffline"))
//    }
//
//    public func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encode(self.id, forKey: "id")
//        aCoder.encode(self.isSignedInOffline, forKey: "isSignedInOffline")
//    }
    
    //MARK: - Equatable
//    override public func isEqual(_ object: Any?) -> Bool {
//        return id == (object as? ServerUserInfo)?.id
//    }
    
    public static func == (lhs: ServerUserInfo, rhs: ServerUserInfo) -> Bool {
        return lhs.id == rhs.id
    }
}
