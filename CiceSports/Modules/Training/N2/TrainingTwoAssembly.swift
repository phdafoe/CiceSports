// TrainingTwoAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class TrainingTwoAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> TrainingTwoViewController {
        let vc = TrainingTwoViewController(nibName: TrainingTwoViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: TrainingTwoViewController) -> TrainingTwoPresenterProtocol {
        let presenter = TrainingTwoPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> TrainingTwoInteractorProtocol {
        let interactor = TrainingTwoInteractorImpl()
        return interactor
    }
    
    static func router(viewController: TrainingTwoViewController, presenter: TrainingTwoPresenterProtocol) -> TrainingTwoRouterProtocol {
        let router = TrainingTwoRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

