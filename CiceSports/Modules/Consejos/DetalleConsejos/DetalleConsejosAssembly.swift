//
//  DetalleConsejosAssembly.swift
//  CiceSports
//
//  Created by cice on 03/06/2021.
//

import Foundation

final class DetalleConsejosAssembly {
    
    static func viewController(data: DetalleConsejosAssemblyDTO? = nil) -> DetalleConsejosViewController {
        let vc = DetalleConsejosViewController(nibName: DetalleConsejosViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(data: data)
        return vc
    }
    
    static func presenter(data: DetalleConsejosAssemblyDTO? = nil) -> DetalleConsejosPresenterProtocol {
        let presenter = DetalleConsejosPresenterImpl()
        presenter.dataMessage = data?.messages ?? []
        return presenter
    }
}

struct DetalleConsejosAssemblyDTO {
    var messages: [MessageArray]?
}
