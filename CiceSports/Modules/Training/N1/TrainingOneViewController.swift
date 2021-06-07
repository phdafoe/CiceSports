//
//  TrainingOneViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol TrainingOneViewControllerProtocol {
    func reloadData()
}

class TrainingOneViewController: BaseViewController<TrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
        //self.showLoading()
    }
    
}

extension TrainingOneViewController: TrainingOneViewControllerProtocol {
    
    func reloadData() {
        //self.hideLoading()
    }
    
}
