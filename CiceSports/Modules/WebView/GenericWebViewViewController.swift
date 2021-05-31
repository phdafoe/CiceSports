//
//  GenericWebViewViewController.swift
//  CiceSports
//
//  Created by cice on 31/05/2021.
//

import UIKit

protocol GenericWebViewViewControllerProtocol {
    
}

class GenericWebViewViewController: BaseViewController<GenericWebViewPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension GenericWebViewViewController: GenericWebViewViewControllerProtocol {
    
    
}
