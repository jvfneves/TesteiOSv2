//
//  Endpoints.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Bank: Endpoint {
        case Login
        case Statements
        
        public var path: String {
            switch self {
            case .Login: return "/login"
            case .Statements: return "/statements/"
            }
        }
        public var url: String {
            switch self {
            default: return "\(Constants.APIEndPoint)\(path)"
            }
        }
    }
    
}
