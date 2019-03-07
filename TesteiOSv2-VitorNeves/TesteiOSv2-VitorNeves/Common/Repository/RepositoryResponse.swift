//
//  RepositoryResponse.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

public protocol RepositoryResponseProtocol : Codable {
    var code: Int? { get set }
    var message: String? { get set }
}

public struct nullStruct : Codable {}

public struct RepositoryResponse<T>: Codable, RepositoryResponseProtocol where T: Codable {
    public var data: T?
    public var code: Int?
    public var message: String?
    
    public enum ResponseKeys: String, CodingKey
    {
        case data, code, message
    }
    
    public init (from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: ResponseKeys.self)
        code = try container.decode(Int.self, forKey: .code)
        if code != nil {
            data = try container.decode(T.self, forKey: .data)
        } else if let d = try? container.decode(T.self, forKey: .data) {
            data = d
        }
        message = try container.decode(String.self, forKey: .message)
    }
}
