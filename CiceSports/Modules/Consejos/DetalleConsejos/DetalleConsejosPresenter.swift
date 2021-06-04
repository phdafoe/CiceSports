//
//  DetalleConsejosPresenter.swift
//  CiceSports
//
//  Created by cice on 03/06/2021.
//

import Foundation

protocol DetalleConsejosPresenterProtocol {
    func numberOfRowInSection() -> Int
    func informationForItem(indexPath: Int) -> MessageArray
}


class DetalleConsejosPresenterImpl {
    
    var dataMessage: [MessageArray] = []
    
}

extension DetalleConsejosPresenterImpl: DetalleConsejosPresenterProtocol {
    
    internal func numberOfRowInSection() -> Int {
        self.dataMessage.count
    }
    
    func informationForItem(indexPath: Int) -> MessageArray {
        self.dataMessage[indexPath]
    }
    
}
