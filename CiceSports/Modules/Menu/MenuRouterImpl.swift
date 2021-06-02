// MenuRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuRouterProtocol {
    func showWebSiteInRouter()
    func showDefaultAlert(delegate: AlertDefaultViewControllerDelegate, model: AlertDefaultViewModel)
    func navigateToConsejosRouter(data: [ConsejosGenerale])
}

class MenuRouterImpl: BaseRouter< MenuPresenterProtocol> {
    
    
}

extension MenuRouterImpl: MenuRouterProtocol {
    func showWebSiteInRouter() {
        let vc = GenericWebViewAssembly.navigationController()
        self.presentVC(vc, animated: true, completion: nil)
    }
    
    func showDefaultAlert(delegate: AlertDefaultViewControllerDelegate, model: AlertDefaultViewModel) {
        let vc = AlertDefaultViewController()
        vc.delegate = delegate
        vc.viewModel = model
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func navigateToConsejosRouter(data: [ConsejosGenerale]) {
        let vc = ConsejosAssembly.navigationController(data: ConsejosAssemblyDTO.init(consejos: data))
        viewController?.present(vc, animated: true, completion: nil)
    }
    
}
