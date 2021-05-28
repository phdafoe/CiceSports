//
//  TrainignTwoViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol TrainignTwoViewControllerProtocol {
    
}

class TrainignTwoViewController: BaseViewController<TrainignTwoPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
    }
    
}

extension TrainignTwoViewController: TrainignTwoViewControllerProtocol {
    
    
}

