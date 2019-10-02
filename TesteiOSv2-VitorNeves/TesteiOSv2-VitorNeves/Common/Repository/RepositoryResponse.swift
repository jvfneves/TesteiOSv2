//
//  RepositoryResponse.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

//MARK: - Structs Response
struct ErrorRepo : Codable {
    
    //MARK: - Properties
    var code: Int?
    var message: String?
}

public struct RepositoryResponse<T:Codable> : Codable{
    
    //MARK: - Properties
    var data: T?
    var error: ErrorRepo?
    
    //MARK: - Enum
    public enum ResponseKeys: String, CodingKey
    {
        case data, error
    }
    
    //MARK: - Init
    public init (from decoder: Decoder) throws {
       let container =  try decoder.container(keyedBy: ResponseKeys.self)
        error = try container.decode(ErrorRepo.self, forKey: .error)
       if error == nil {
           data = try container.decode(T.self, forKey: .data)
       } else if let d = try? container.decode(T.self, forKey: .data) {
           data = d
       }
    }
}
