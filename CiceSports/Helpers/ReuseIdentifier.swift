//
//  ReuseIdentifier.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation
import UIKit

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
