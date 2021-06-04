//
//  DetalleConsejoCell.swift
//  CiceSports
//
//  Created by cice on 03/06/2021.
//

import UIKit

protocol DetalleConsejoCellProtocol {
    func configCell(data: MessageArray)
}

class DetalleConsejoCell: UITableViewCell, DetalleConsejoCellProtocol {
    
    static let identifier = String(describing: DetalleConsejoCell.self)
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var myTitleLBL: UILabel!
    @IBOutlet weak var myMessageLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func configCell(data: MessageArray) {
        self.myTitleLBL.text = data.titleMessage
        self.myMessageLBL.text = data.developMessage
    }
    
}
