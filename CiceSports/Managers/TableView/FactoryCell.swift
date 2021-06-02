//
//  FactoryCell.swift
//  CiceSports
//
//  Created by cice on 02/06/2021.
//

import Foundation
import UIKit

class FactoryCell: NSObject {
    
    class func view(for object: Any?, tableView: UITableView, presenter: Any? = nil) -> UIView {
        return self.cell(for: object, tableView: tableView, presenter: presenter).contentView
    }
    
    class func cell(for object: Any?, tableView: UITableView, presenter: Any? = nil) -> UITableViewCell {
        switch object {
        case let model as ConsejosGenerale:
            return ConsejosGeneralesDrawer.cell(model: model, tableView: tableView, presenter: presenter)
        default:
            return UITableViewCell()
        }
    }
}
