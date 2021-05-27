//
//  SplashRouterImpl.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation

protocol SplashRouterProtocol {
    func goToDetailVC()
}


class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
    
}


extension SplashRouterImpl: SplashRouterProtocol {
    internal func goToDetailVC(){
        //
    }
}
