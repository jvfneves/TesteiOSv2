//
//  Constants.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

class Constants {
    static var BaseUrl = "https://bank-app-test.herokuapp.com"
    
    static var APIEndPoint : String {
        get {
            let value = "\(Constants.BaseUrl)/api"
            return value
        }
    }
    
}
