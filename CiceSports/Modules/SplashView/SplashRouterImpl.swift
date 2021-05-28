//
//  SplashRouterImpl.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation

protocol SplashRouterProtocol {
    func showApp(dataMenu: [MenuResponse])
}


class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
    
}

extension SplashRouterImpl: SplashRouterProtocol {
    internal func showApp(dataMenu: [MenuResponse]){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let assembly = AppAssembly()
        let vc = HomeTabBarAssembly.homeTabBarController()
        assembly.createSlidingMenu(window: delegate.window!, vc: vc, menu: dataMenu)
    }
}
