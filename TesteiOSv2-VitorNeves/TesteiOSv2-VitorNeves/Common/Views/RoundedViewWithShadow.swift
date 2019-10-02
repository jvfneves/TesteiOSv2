//
//  RoundedViewWithShadow.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 06/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import UIKit

class RoundedViewWithShadow: UIView {

    //MARK: - LifeCicle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 6
        layer.shadowColor = #colorLiteral(red: 0.8588235294, green: 0.8745098039, blue: 0.8901960784, alpha: 1)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 1, height: 3)
    }
}
