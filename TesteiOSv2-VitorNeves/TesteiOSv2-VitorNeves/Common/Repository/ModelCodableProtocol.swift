//
//  ModelCodableProtocol.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

//MARK: - Typealias
typealias ModelCodable = Model & Entity & Codable

//MARK: - Protocols
protocol Entity : Codable {
    //MARK: - Properties
    static var endPoint: String { get }
}

protocol Model: Codable {
    //MARK: - Actions
    func toRegisterDictionary() -> [String : Any]
    func jsonData() throws -> Data
    func jsonString(encoding: String.Encoding) throws -> String?
}

//MARK: - Extension
extension Model {
    
    //MARK: - Actions
    func toRegisterDictionary() -> [String : Any] {
        var resultDict : [String : Any] = [:]
        if let jsonDict = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self), options: []), let dict = jsonDict as? [String: Any] {
            resultDict = dict
        }
        return resultDict
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
