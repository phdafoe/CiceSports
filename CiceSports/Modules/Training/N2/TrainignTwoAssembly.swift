// TrainignTwoAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class TrainignTwoAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> TrainignTwoViewController {
        let vc = TrainignTwoViewController(nibName: TrainignTwoViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: TrainignTwoViewController) -> TrainignTwoPresenterProtocol {
        let presenter = TrainignTwoPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> TrainignTwoInteractorProtocol {
        let interactor = TrainignTwoInteractorImpl()
        return interactor
    }
    
    static func router(viewController: TrainignTwoViewController, presenter: TrainignTwoPresenterProtocol) -> TrainignTwoRouterProtocol {
        let router = TrainignTwoRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

