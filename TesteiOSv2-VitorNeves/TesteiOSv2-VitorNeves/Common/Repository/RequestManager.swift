//
//  RequestManager.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Alamofire

class RequestManager {
    
    // MARK: - Singleton
    static let shared = RequestManager()
    
    // MARK: - GET
    public func get<T:Codable>(_ url: String, model: T.Type, headers: HTTPHeaders = [:], completion: @escaping (T?) -> Void, onFailure: @escaping (Error) -> Void ) {
        
        guard let isInternet = NetworkReachabilityManager()?.isReachable else{ return }
        
        if (!isInternet){
            let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Dispositivo sem internet"])
            onFailure(error)
            return
        }
        
        var h = headers
        if let bundleVersion = Bundle.main.infoDictionary?[APISession.HTTPHeaderField.CFBundleShortVersionString] as? String {
            h[APISession.HTTPHeaderField.VersionUser] = bundleVersion
        }
        
        Alamofire.request(url, headers: h).validate().responseJSON { response in
            let statusCode = response.response?.statusCode
            print("statusCode: \(String(describing: statusCode))")
            if statusCode == 401 {
                let unauthorizeError = NSError(domain: "unauthorize.error", code: 401, userInfo:[NSLocalizedDescriptionKey : "Authorization has been denied for this request."])
                onFailure(unauthorizeError)
                return
            }
            
            switch response.result {
            case .success:
                do {
                    if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                        let dictionaryJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        let json = try JSONDecoder().decode(model.self, from: data)
                        completion(json)
                    } else {
                        completion(nil)
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
    public func post<T:Codable>(_ url: String, model: T.Type, params: Parameters, headers: HTTPHeaders = [:], onSuccess: @escaping (T?) -> Void, onFailure: @escaping (Error) -> Void) {
        
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
                        onSuccess(json)
//                        if json.code == nil {
//                            onSuccess(json)
//                        } else {
//                            let er = NSError(domain: "server.response.error", code: 401, userInfo:["message" : json.message ?? "Server error message"])
//                            onFailure(er)
//                        }
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
