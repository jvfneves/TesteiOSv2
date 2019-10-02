//
//  RepositoryResponse.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

//MARK: - Structs
public struct nullStruct : Codable {}

struct ErrorRepo : Codable {
    var code: Int?
    var message: String?
}

public struct RepositoryResponse<T:Codable> : Codable{
    var data: T?
    var responseError: ErrorRepo?
    
    public enum ResponseKeys: String, CodingKey
    {
        case data, responseError = "error"
    }
    
    public init (from decoder: Decoder) throws {
       let container =  try decoder.container(keyedBy: ResponseKeys.self)
        responseError = try container.decode(ErrorRepo.self, forKey: .responseError)
       if responseError == nil {
           data = try container.decode(T.self, forKey: .data)
       } else if let d = try? container.decode(T.self, forKey: .data) {
           data = d
       }
    }
}
