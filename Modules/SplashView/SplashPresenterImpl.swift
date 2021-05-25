//
//  SplashPresenterImpl.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation

protocol SplashPresenterProtocol {
    func fetchDataFromItunes()
}


class SplashPresenterImpl: BasePresenter<SplashViewController, SplashRouterProtocol> {
    
}

extension SplashPresenterImpl: SplashPresenterProtocol {
    internal func fetchDataFromItunes() {
        self.router?.goToDetailVC()
    }
}
