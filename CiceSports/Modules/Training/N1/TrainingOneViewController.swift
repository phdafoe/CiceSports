//
//  TrainingOneViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol TrainingOneViewControllerProtocol {
    
}

class TrainingOneViewController: BaseViewController<TrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
       
    }
    
}

extension TrainingOneViewController: TrainingOneViewControllerProtocol {
    
    
}
