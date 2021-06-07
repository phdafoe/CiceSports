//
//  ReuseIdentifier.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation
import UIKit
import MessageUI

public protocol ReuseIdentifierInterface: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReuseIdentifierInterface where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public protocol ReuseIdentifierInterfaceViewController: class {
    static var defaultReuseIdentifierViewController: String { get }
}

public extension ReuseIdentifierInterfaceViewController where Self: UIViewController {
    static var defaultReuseIdentifierViewController: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UIViewController {
    
    func menuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_Iz"),
                                         style: .plain,
                                         target: revealViewController(),
                                         action: #selector(SWRevealViewController.revealToggle(_:)))
        revealViewController()?.rightViewRevealWidth = 150
        revealViewController()?.panGestureRecognizer()
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailCompose = MFMailComposeViewController()
        mailCompose.setToRecipients(["info@icologic.com"])
        mailCompose.setSubject("Ayuda desde la App CiceSports")
        mailCompose.setMessageBody("Escribe tu mensaje al equipo de sporte de CiceSports", isHTML: false)
        return mailCompose
    }
    
    func showAlertVC(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        return alert
    }
    
}

func showImageMenuWithName(imageMenu: Menu) -> UIImage {
    switch imageMenu.imagen {
    case "iconoAvatar":
        return #imageLiteral(resourceName: "imagenLanzamientoApp")
    case "musicAvatar":
        return #imageLiteral(resourceName: "musicAvatar")
    case "calendarioAvatar":
        return #imageLiteral(resourceName: "calendarioAvatar")
    case "consejosAvatar":
        return #imageLiteral(resourceName: "consejosAvatar")
    default:
        return #imageLiteral(resourceName: "nosotrosAvatar")
    }
}

func showImageConsejosWithName(imageConsejos: ConsejosGenerale) -> UIImage {
    switch imageConsejos.image {
    case "icono_obstaculos":
        return #imageLiteral(resourceName: "workout_58")
    case "icono_carrera":
        return #imageLiteral(resourceName: "workout_80")
    default:
        return #imageLiteral(resourceName: "workout_12")
    }
}
