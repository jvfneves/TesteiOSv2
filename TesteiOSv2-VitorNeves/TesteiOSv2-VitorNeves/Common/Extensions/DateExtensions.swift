//
//  DateExtensions.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 05/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String, locale: Locale = Locale(identifier: "pt-BR")) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        //formatter.timeZone = TimeZone.init(identifier: "GMT-03:00")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func toStringFormatter(data : Date, format: String)-> (String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: data)
    }
}
