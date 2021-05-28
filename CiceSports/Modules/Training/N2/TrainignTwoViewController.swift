// TrainignTwoViewController.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import UIKit

protocol TrainignTwoViewControllerProtocol {
    
}

class TrainignTwoViewController: BaseViewController<TrainignTwoPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension TrainignTwoViewController: TrainignTwoViewControllerProtocol {
    
    
}
