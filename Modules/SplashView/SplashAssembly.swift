//
//  SplashAssembly.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation

final public class SplashAssembly {
    
    static func splashNavigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: splashViewController())
        return navigationController
    }
    
    static func splashViewController() -> SplashViewController {
        let vc = SplashViewController(nibName: SplashViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = splashPresenter(viewController: vc)
        return vc
    }
    
    static func splashPresenter(viewController: SplashViewController) -> SplashPresenterProtocol {
        let presenter = SplashPresenterImpl(viewController: viewController)
        presenter.router = splashRouter(viewController: viewController, presenter: presenter)
        return presenter
    }
    
    static func splashRouter(viewController: SplashViewController, presenter: SplashPresenterProtocol) -> SplashRouterProtocol {
        let router = SplashRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

