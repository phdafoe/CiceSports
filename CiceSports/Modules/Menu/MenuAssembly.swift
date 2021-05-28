// MenuAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class MenuAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> MenuViewController {
        let vc = MenuViewController(nibName: MenuViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: MenuViewController) -> MenuPresenterProtocol {
        let presenter = MenuPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> MenuInteractorProtocol {
        let interactor = MenuInteractorImpl()
        return interactor
    }
    
    static func router(viewController: MenuViewController, presenter: MenuPresenterProtocol) -> MenuRouterProtocol {
        let router = MenuRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

