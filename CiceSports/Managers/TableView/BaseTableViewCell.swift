//
//  BaseTableViewCell.swift
//  CiceSports
//
//  Created by cice on 02/06/2021.
//

import Foundation
import UIKit

class BaseTableViewCell<CellModel: Any>: UITableViewCell {
    
    var cellModel: CellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        self.clear()
    }
    
    func clear() {}
    
    func configured(cellModel: CellModel) {
        self.cellModel = cellModel
    }
}

extension BaseTableViewCell {
    static func createBaseCell<CellModel: Any, CellClass: BaseTableViewCell<CellModel>>(tableView: UITableView, cell: CellClass.Type, cellName: String, model: CellModel) -> CellClass? {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CellClass
        if cell == nil {
            tableView.register(UINib(nibName: cellName, bundle: .main), forCellReuseIdentifier: cellName)
            cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CellClass
        }
        cell?.configured(cellModel: model)
        return cell
    }
}
