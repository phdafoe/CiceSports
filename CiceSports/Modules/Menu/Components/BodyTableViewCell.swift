//
//  BodyTableViewCell.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol BodyTableViewCellDelegate: class {
    func sendInfoToVC(data: Menu)
}

protocol BodyTableViewCellProtocol {
    func configCell(data: Menu)
}

class BodyTableViewCell: UITableViewCell, ReuseIdentifierInterface {
    
    weak var delegate: BodyTableViewCellDelegate!
    var data: Menu?
    
    @IBOutlet weak var myImageAvatarCell: UIImageView!
    @IBOutlet weak var myNameAvatarLBL: UILabel!
    
    @IBAction func showAlertView(_ sender: Any) {
        self.delegate.sendInfoToVC(data: self.data!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}

extension BodyTableViewCell: BodyTableViewCellProtocol {
    internal func configCell(data: Menu) {
        self.data = data
        self.myNameAvatarLBL.text = data.literal
        self.myImageAvatarCell.image = showImageMenuWithName(imageMenu: data)
    }
}
