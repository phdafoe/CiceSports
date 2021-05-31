// GenericWebViewAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class GenericWebViewAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> GenericWebViewViewController {
        let vc = GenericWebViewViewController(nibName: GenericWebViewViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: GenericWebViewViewController) -> GenericWebViewPresenterProtocol {
        let presenter = GenericWebViewPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> GenericWebViewInteractorProtocol {
        let interactor = GenericWebViewInteractorImpl()
        return interactor
    }
    
    static func router(viewController: GenericWebViewViewController, presenter: GenericWebViewPresenterProtocol) -> GenericWebViewRouterProtocol {
        let router = GenericWebViewRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

