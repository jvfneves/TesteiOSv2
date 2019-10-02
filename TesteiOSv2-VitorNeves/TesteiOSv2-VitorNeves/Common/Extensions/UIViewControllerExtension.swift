//
//  UIViewControllerExtension.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 04/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {

    //MARK: - Alert
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertActionCancel = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(alertActionCancel)
        self.present(alert,animated: true)
    }
    
    //MARK: - SVProgressHUD
    func showHUD(){
        SVProgressHUD.show()
    }
    
    func dismissHUD() {
        SVProgressHUD.dismiss()
    }
}
