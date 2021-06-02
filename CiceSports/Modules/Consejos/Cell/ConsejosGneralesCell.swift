//
//  ConsejosGneralesCell.swift
//  CiceSports
//
//  Created by cice on 02/06/2021.
//

import UIKit

class ConsejosGneralesCell: BaseTableViewCell<ConsejosGenerale>, ReuseIdentifierInterface {

    var model: ConsejosGenerale?
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameConsejosLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func configured(cellModel: ConsejosGenerale) {
        self.myNameConsejosLBL.text = cellModel.title
    }
    
}
