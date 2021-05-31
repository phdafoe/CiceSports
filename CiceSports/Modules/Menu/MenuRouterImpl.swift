// MenuRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuRouterProtocol {
    func showWebSiteInRouter()
}

class MenuRouterImpl: BaseRouter< MenuPresenterProtocol> {
    
    
}

extension MenuRouterImpl: MenuRouterProtocol {
    func showWebSiteInRouter() {
        let vc = GenericWebViewAssembly.navigationController()
        vc.modalPresentationStyle = .fullScreen
        self.presentVC(vc, animated: true, completion: nil)
    }
    
}
