//
//  HomeTabBarAssembly.swift
//  CiceSports
//
//  Created by cice on 27/05/2021.
//

import Foundation
import UIKit

final public class HomeTabBarAssembly {
    
    static func homeTabBarController() -> HomeTabBarController {
        
        let viewController = HomeTabBarController(nibName: HomeTabBarController.defaultReuseIdentifierViewController, bundle: nil)
        
        let oneViewController = TrainingOneAssembly.navigationController()
        let twoViewController = TrainignTwoAssembly.navigationController()
        
        let oneCustomTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "TRIFECA_0M"), selectedImage: UIImage(named: "TRIFECA_0M"))
        let twoCustomTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "TRIFECA_1M"), selectedImage: UIImage(named: "TRIFECA_1M"))
        
        oneViewController.tabBarItem = oneCustomTabBarItem
        twoViewController.tabBarItem = twoCustomTabBarItem
        
        viewController.viewControllers = [oneViewController, twoViewController]
        
        switch viewController.selectedIndex {
        case 0:
            "Nivel 1"
        default:
            "Nivel 2"
        }
        
        return viewController
    }
}

