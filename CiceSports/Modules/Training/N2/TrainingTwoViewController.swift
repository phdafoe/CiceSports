// TrainingTwoViewController.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import UIKit

protocol TrainingTwoViewControllerProtocol {
    
}

class TrainingTwoViewController: BaseViewController<TrainingTwoPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension TrainingTwoViewController: TrainingTwoViewControllerProtocol {
    
    
}
