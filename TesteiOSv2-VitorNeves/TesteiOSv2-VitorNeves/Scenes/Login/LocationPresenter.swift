//
//  LocationPresenter.swift
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

protocol LocationPresentationLogic
{
  func presentLoginResults(response: Location.Login.Response)
}

class LocationPresenter: LocationPresentationLogic
{
  weak var viewController: LocationDisplayLogic?
  
  func presentLoginResults(response: Location.Login.Response)
  {
    if response.userAccount != nil {
        viewController?.validLogin(response.userAccount!)
    } else {
        viewController?.displayError(response.error!)
    }
  }
}
