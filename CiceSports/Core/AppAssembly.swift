//
//  AppAssembly.swift
//  CiceSports
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/5/21.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol {
    func setPrincipalViewController(in window: UIWindow)
}

class AppAssembly: AppAssemblyProtocol {
    
    var actualViewController: UIViewController!
    public typealias HTTPHeaders = [String: String]
    
    internal func setPrincipalViewController(in window: UIWindow) {
        self.customUI()
        actualViewController = SplashAssembly.splashViewController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
    
    internal func createSlidingMenu(window: UIWindow, vc: UIViewController, menu: [MenuResponse]){
        self.customUI()
        let frontViewController = vc
        let rearViewController = MenuAssembly.viewController(menu: dataDTO.init(menu: menu))
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
    
    
    fileprivate func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        navBar.barTintColor = #colorLiteral(red: 0.2328504622, green: 0.2328960001, blue: 0.2328444719, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.2328504622, green: 0.2328960001, blue: 0.2328444719, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navBar.barStyle = .black
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
    }
    
    public static let defaultHTTPHeaders: HTTPHeaders = {
        let BearerAuthentication = AuthHeroku.authHeroku
        return [
            "Authorization": BearerAuthentication
        ]
    }()
}
