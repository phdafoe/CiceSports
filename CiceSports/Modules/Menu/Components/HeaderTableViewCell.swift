//
//  HeaderTableViewCell.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol HeaderTableViewCellProtocol {
    func configCell(data: Menu)
}


class HeaderTableViewCell: UITableViewCell, ReuseIdentifierInterface, HeaderTableViewCellProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var myImageAvatar: UIImageView!
    @IBOutlet weak var myLiteralLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myImageAvatar.layer.cornerRadius = self.myImageAvatar.frame.width / 2
        self.myImageAvatar.layer.borderColor = UIColor(red: 252/255, green: 164/255, blue: 56/255, alpha: 1).cgColor
        self.myImageAvatar.layer.borderWidth = 1.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func configCell(data: Menu) {
        self.myLiteralLBL.text = data.literal
    }
    
}
