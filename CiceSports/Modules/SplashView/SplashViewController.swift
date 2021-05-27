//
//  SplashViewController.swift
//  CiceSports
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/5/21.
//

import UIKit

protocol SplashViewControllerProtocol {
    
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierInterfaceViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromHeroku()
    }

}

extension SplashViewController: SplashViewControllerProtocol{

}
