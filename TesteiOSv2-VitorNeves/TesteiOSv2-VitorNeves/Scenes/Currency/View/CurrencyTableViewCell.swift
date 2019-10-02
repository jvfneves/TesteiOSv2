//
//  CurrencyTableViewCell.swift
//  TesteiOSv2-VitorNeves
//
//  Created by joao.vitor.f.naves on 05/03/2019.
//  Copyright © 2019 joao.vitor.f.naves. All rights reserved.
//

import UIKit

//MARK: - Protocols
protocol CurrencyTableViewCellProtocol: class {
    func didSelectCurrency(cell: CurrencyTableViewCell, currency: Currency.Statement)
}

class CurrencyTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var namePaymentLabel: UILabel!
    @IBOutlet weak var datePaymentLabel: UILabel!
    @IBOutlet weak var typePaymentLabel: UILabel!
    @IBOutlet weak var valueTypePaymentLabel: UILabel!
    
    //MARK: - Properties
    public weak var delegate : CurrencyTableViewCellProtocol?
    
    //MARK: - Setters
    public var statement: Currency.Statement? {
        didSet {
            self.namePaymentLabel.text = statement?.title
            //self.datePaymentLabel.text = statement?.date.toString(format: "dd/MM/yyyy")
            self.typePaymentLabel.text = statement?.desc
            self.valueTypePaymentLabel.text = String(format: "R$ %.02f", locale: Locale.current, arguments: [statement?.value ?? "R$ 0,00"])
        }
    }
    
    //MARK: - LifeCicle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - Action
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
