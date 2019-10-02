//
//  CurrencyHeaderTableViewCell.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 05/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import UIKit

//MARK: - Protocols
protocol CurrencyHeaderTableViewCellProtocol: class {
    func didSelectCurrencyHeader(cell: CurrencyHeaderTableViewCell)
}

class CurrencyHeaderTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var titleHeaderLabel: UILabel!
    
    //MARK: - Properties
    public weak var delegate : CurrencyHeaderTableViewCellProtocol?
    
    //MARK: - LifeCicle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
