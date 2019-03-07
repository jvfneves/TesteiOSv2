//
//  RequestManager.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

open class RequestManager {
    
    private let maxRetryCount : Int = 2
    
    // singleton
    public static let shared = RequestManager()
    
    // MARK: - GET
    public func get<T:RepositoryResponseProtocol>(_ url: String, model: T.Type, headers: HTTPHeaders = [:], onSuccess: @escaping (T?) -> Void, onFailure: @escaping (Error) -> Void ) {
        
        var h = headers
        if let bundleVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            h["VersionUser"] = bundleVersion
        }
        
        print("header: \(h)")
        print(url)
        Alamofire.request(url, headers: h).responseJSON { response in
            let statusCode = response.response?.statusCode
            print("Repository - statusCode: \(String(describing: statusCode))")
            if statusCode == 401 {
                let unauthorizeError = NSError(domain: "unauthorize.error", code: 401, userInfo:["message" : "Authorization has been denied for this request."])
                onFailure(unauthorizeError)
                return
            }
            
            switch response.result {
            case .success:
                do {
                    if let data = response.data, let utf8Response = String(data: data, encoding: .utf8) {
                        print("Repository - response: \(utf8Response)")
                        let json = try JSONDecoder().decode(T.self, from: data)
                        if json.code == nil {
                            onSuccess(json)
                        } else {
                            let er = NSError(domain: "server.response.error", code: 401, userInfo:["message" : json.message ?? "Server error message"])
                            onFailure(er)
                        }
                    } else {
                        onSuccess(nil)
                    }
                } catch {
                    onFailure(error)
                }
            case .failure(let error):
                onFailure(error)
            }
        }
        
    }
    
    // MARK: - POST
    public func post<T:RepositoryResponseProtocol>(_ url: String, model: T.Type, params: Parameters, headers: HTTPHeaders = [:], onSuccess: @escaping (T?) -> Void, onFailure: @escaping (Error) -> Void) {
        
        var h : HTTPHeaders = headers
        h["Content-Type"] = "application/json"
        print("Content-Type: application/json")
        
        if let bundleVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            h["VersionUser"] = bundleVersion
            print("VersionUser: \(bundleVersion)")
        }
        
        print("header: \(h)")
        print("body: \(params)")
        print(url)
        Alamofire.request(url, method: .post, parameters: params, encoding:JSONEncoding.default, headers: h).responseJSON { response in
            let statusCode = response.response?.statusCode
            print("Repository - statusCode: \(String(describing: statusCode))")
            if statusCode == 401 {
                let unauthorizeError = NSError(domain: "unauthorize.error", code: 401, userInfo:["message":"Authorization has been denied for this request."])
                onFailure(unauthorizeError)
                return
            }
            
            switch response.result {
            case .success:
                do {
                    if let data = response.data, let utf8Response = String(data: data, encoding: .utf8) {
                        print("Repository - response: \(utf8Response)")
                        let json = try JSONDecoder().decode(T.self, from: data)
                        if json.code == nil {
                            onSuccess(json)
                        } else {
                            let er = NSError(domain: "server.response.error", code: 401, userInfo:["message" : json.message ?? "Server error message"])
                            onFailure(er)
                        }
                    } else {
                        onSuccess(nil)
                    }
                } catch {
                    onFailure(error)
                }
            case .failure(let error):
                onFailure(error)
            }
        }
        
    }
    
}
