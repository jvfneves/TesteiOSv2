//
//  LocationModels.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright (c) 2019 joao.vitor.f.naves. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

struct Location {
    
    struct Login {
        
        struct Request {
            var user: String?
            var password: String?
        }
        
        struct Response : Codable{
            var userAccount: UserAccount?
            var error: ErrorRepo?
        }
        
    }
    
    struct UserAccount : Codable {
        var userId: Int?
        var name: String?
        var bankAccount: String?
        var agency: String?
        var balance: Float64?
    }
}
