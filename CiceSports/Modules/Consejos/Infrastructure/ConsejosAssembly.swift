// ConsejosAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class ConsejosAssembly {
    
    static func navigationController(data: ConsejosAssemblyDTO? = nil) -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController(data: data))
        return navigationController
    }
    
    static func viewController(data: ConsejosAssemblyDTO? = nil) -> ConsejosViewController {
        let vc = ConsejosViewController(nibName: ConsejosViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, data: data)
        return vc
    }
    
    static func presenter(viewController: ConsejosViewController, data: ConsejosAssemblyDTO? = nil) -> ConsejosPresenterProtocol {
        let presenter = ConsejosPresenterImpl(viewController: viewController)
        presenter.arrayConsejosGenerales = data?.consejos ?? []
        presenter.router = router(viewController: viewController, presenter: presenter)
        return presenter
    }
    
    static func router(viewController: ConsejosViewController, presenter: ConsejosPresenterProtocol) -> ConsejosRouterProtocol {
        let router = ConsejosRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

struct ConsejosAssemblyDTO {
    var consejos: [ConsejosGenerale]
}

