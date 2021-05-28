// TrainingOneAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class TrainingOneAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> TrainingOneViewController {
        let vc = TrainingOneViewController(nibName: TrainingOneViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: TrainingOneViewController) -> TrainingOnePresenterProtocol {
        let presenter = TrainingOnePresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> TrainingOneInteractorProtocol {
        let interactor = TrainingOneInteractorImpl()
        return interactor
    }
    
    static func router(viewController: TrainingOneViewController, presenter: TrainingOnePresenterProtocol) -> TrainingOneRouterProtocol {
        let router = TrainingOneRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

