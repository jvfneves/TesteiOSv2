//
//  APISession.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 30/09/19.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

class APISession {
    
    //MARK: - Properties
    private static let BaseUrl = "https://bank-app-test.herokuapp.com"
    
    static var APIEndPoint : String {
        get {
            let value = "\(APISession.BaseUrl)/api"
            return value
        }
    }
    
    //MARK: - Request
    struct HTTPHeaderField {
        static let AplicationJSON = "application/json"
        static let ContentType = "Content-Type"
        static let VersionUser = "VersionUser"
        static let CFBundleShortVersionString = "CFBundleShortVersionString"
    }
}
