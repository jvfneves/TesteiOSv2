//
//  CurrencyInteractor.swift
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

protocol CurrencyBusinessLogic
{
    func getUserAccount() -> Location.UserAccount?
    func fetchStatements(request: Currency.Request)
}

protocol CurrencyDataStore
{
    var userAccount: Location.UserAccount? { get set }
}

class CurrencyInteractor: CurrencyBusinessLogic, CurrencyDataStore
{
    var presenter: CurrencyPresentationLogic?
    var worker: CurrencyWorker?
    var userAccount: Location.UserAccount?
    
    func getUserAccount() -> Location.UserAccount? {
        return userAccount
    }
    
    func fetchStatements(request: Currency.Request) {
        
        worker = CurrencyWorker()
        worker?.fetchStatements(userId: request.userId, responseRequest: { response in
            self.presenter?.presentStatements(response: response)
        })
    }
}
