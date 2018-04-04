//
//  HttpClient.swift
//  Emby.ApiClient
//
//  Created by Vedran Ozir on 07/10/15.
//  Copyright © 2015 Vedran Ozir. All rights reserved.
//

import Foundation
import Alamofire

public class HttpClient : IAsyncHttpClient {
    
    private let logger: ILogger
    private let context: Context
    
    public init(logger: ILogger, context: Context) {
        self.logger = logger;
        self.context = context;
    }
    
    public func sendRequest<T : Codable>(request: HttpRequest, success: @escaping (T) -> Void, failure: @escaping (EmbyError) -> Void) {
        
        Alamofire.request(request)
            .validate { request, response, data in
                // custom evalution clousre now includes data (allows you to parse data to dig out error messeages
                return .success
            }
            .responseJSON { response in
//                if case .success(let json) = try! JSONDecoder().decode(T.self, from: response.data!){
//                    if  let jsonObject = json as? JSON_Object {
//
//                        if let object = T(jSON: jsonObject) {
//                            success(object)
//                        }
//                        else {
//                            failure(EmbyError.JsonDeserializationError)
//                        }
//                    }
//                    else {
//                        failure(EmbyError.JsonDeserializationError)
//                    }
//                }
//                else if case .failure(let error) = response.result {
//                    if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
//                        print("Server Error: " + str)
//                    }
//                    failure(EmbyError.NetworkRequestError(error.localizedDescription))
//                }
                
                if case .failure(let error) = response.result {
                    if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                        print("Server Error: " + str)
                    }
                    failure(EmbyError.NetworkRequestError(error.localizedDescription))
                    return
                }
                
                
                do{
                    let object = try EmbyJson.decoder.decode(T.self, from: response.data!)
                   
                        success(object)
                }
                    
                catch let error{
                    print("Date string does not match format expected by formatter: \(error)")
                    failure(EmbyError.JsonDeserializationError)
                }
                
                
        }
    }
    
    public func sendCollectionRequest<T : Codable>(request: HttpRequest, success: @escaping ([T]) -> Void, failure: @escaping (EmbyError) -> Void) {
        Alamofire.request(request)
            .validate { request, response, data in
                // custom evalution clousre now includes data (allows you to parse data to dig out error messeages
                print(response.description)

                return .success
            }
            .responseJSON { response in
                print(response.result.error?.localizedDescription)
//                if case .success(_) = response.result {
//                    print(response.result.value as? JSON_Object)
//                    if let jsonArray = response.result.value as? JSON_Array {
//
//                        var results: [T] = []
//
//                        for object in jsonArray {
//                            if let jsonObject = object as? JSON_Object, let object = T(jSON: jsonObject) {
//                                results.append(object)
//                            }
//                        }
//
//                        success(results)
//                    }
//                    else {
//                        failure(EmbyError.JsonDeserializationError)
//                    }
//                }
//                else if case .failure(let error) = response.result {
//                    failure(EmbyError.NetworkRequestError(error.localizedDescription))
//                }
                
//                guard response.result.isSuccess else
//                {
//                    let error = response.result as! Error
//                    failure(EmbyError.NetworkRequestError(error.localizedDescription))
//                    return
//                }
//                print("JSON_Object: \(response.result.value as? JSON_Object)")
//                print("JSON_Array: \(response.result.value as? JSON_Array)")
//                print("Raw result value: \(response.result.value)")
                
                if let jsonArray = response.result.value as? JSON_Array {
                    
                    var results: [T] = []
                    
//                    for object in jsonArray {
//                        do{
//                            let object = try JSONDecoder().decode(T.self, from: response.data!)
//                            if let jsonObject = object as? JSON_Object  {
//                                results.append(object)
//                            }
//                        }
//
//                        catch let error{
//                            print("Data string does not match format expected by formatter: \(error)")
//                        }
//                    }
                    
                    do {
                        let results = try EmbyJson.decoder.decode([T].self, from: response.data!)
                        print(results)
                        success(results)
                    }
                    catch let error{
                        print("JSON_Array: \(response.result.value as? JSON_Array)")
                        print("Data string does not match format expected by formatter: \(error)")
                    }
                    
                    
                    
                }
                else if let jsonArray = (response.result.value as! JSON_Object)["Items"] as? JSON_Array
                {
                    
                        
                    do{
                        // The automatic conversion from PascalCase to CamelCase is a work in progress
//                        let decoder = EmbyJson.decoder
//                        decoder.keyDecodingStrategy = .convertFromUpperCamelCase
                        let results = try EmbyJson.decoder.decode(QueryResult<T>.self, from: response.data!)
                        success(results.items!)
                    }
                        
                    catch {
                        print("Data string does not match format expected by formatter: \(error)")
                    }
                    
                    
                }
                else
                {
                    failure(EmbyError.JsonDeserializationError)
                }
             
                
        }
    }
}

public enum EmbyError: Error {
    
    case JsonDeserializationError
    case NetworkRequestError(String)
}
