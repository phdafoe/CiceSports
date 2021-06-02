//
//  ConsejosViewController.swift
//  CiceSports
//
//  Created by cice on 01/06/2021.
//

import UIKit

protocol ConsejosViewControllerProtocol {
    
}

class ConsejosViewController: BaseViewController<ConsejosPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    @IBOutlet weak var myTableViewConsejos: UITableView!
    var tableViewManager: TableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getData()
        self.tableViewManager = TableViewManager(pTableView: self.myTableViewConsejos, pPresenter: self.presenter)
    }
    
}

extension ConsejosViewController: ConsejosViewControllerProtocol {
    
    
}

