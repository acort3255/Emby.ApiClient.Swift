//
//  JsonSerializer.swift
//  Emby.ApiClient
//
//  Created by Vedran Ozir on 12/10/15.
//  Copyright © 2015 Vedran Ozir. All rights reserved.
//

import Foundation

public class JsonSerializer: IJsonSerializer {
    
    public init() {
    }
    
    public func DeserializeFromString<T: JSONSerializable>(text: String, type: Any?) throws -> T? {
        
        if let data = text.data(using: String.Encoding.utf8), !text.isEmpty {
            
            let json = try JSONSerialization.jsonObject( with: data, options: [])
            
            if let jsonObject = json as? JSON_Object {
                return T(jSON: jsonObject)
            } else {
                return nil
            }
            
        } else {
            print("no response: '\(text)'")
            
            return nil
        }
    }
    
    public func serializeToString(obj: AnyObject) -> String {
        if let jsonData = try? JSONSerialization.data(withJSONObject: obj, options: []) {
            return String(describing: NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue))
        }
        
        return ""
    }

}

public class EmbyJson{
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        return decoder
    }()
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

struct AnyCodingKey : CodingKey {
    
    var stringValue: String
    var intValue: Int?
    
    init(_ base: CodingKey) {
        self.init(stringValue: base.stringValue, intValue: base.intValue)
    }
    
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }
}

extension JSONDecoder.KeyDecodingStrategy {
    
    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { codingKeys in
            
            var key = AnyCodingKey(codingKeys.last!)
            
            // lowercase first letter
            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex
                key.stringValue.replaceSubrange(
                    i ... i, with: String(firstChar).lowercased()
                )
            }
            return key
        }
    }
}
