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
    
    static func viewController(menu: dataDTO? = nil) -> MenuViewController {
        let vc = MenuViewController(nibName: MenuViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, menu: menu!)
        return vc
    }
    
    static func presenter(viewController: MenuViewController, menu: dataDTO) -> MenuPresenterProtocol {
        let presenter = MenuPresenterImpl(viewController: viewController)
        presenter.datamenu = menu.menu
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

struct dataDTO {
    var menu: [MenuResponse]
}

