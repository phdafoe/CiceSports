// ConsejosRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosRouterProtocol {
    func showDetail(data: [MessageArray])
    
}

class ConsejosRouterImpl: BaseRouter<ConsejosPresenterProtocol> {
    
    
}

extension ConsejosRouterImpl: ConsejosRouterProtocol {
    
    func showDetail(data: [MessageArray]) {
        //let vc = DetalleConsejosAssembly.viewController(data: DetalleConsejosAssemblyDTO.init(messages: data))
        //self.show(vc)
    }
    
}
