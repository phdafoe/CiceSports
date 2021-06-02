//
//  TablePresenterProtocol.swift
//  CiceSports
//
//  Created by cice on 02/06/2021.
//

import Foundation

protocol TablePresenterProtocol: class {
    
    var delegate: TablePresenterDelegate? { get set }
    
    func numberOfCell(_ tableType: TableType, section: Int) -> Int
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any
    func didTapRow(_ tableType: TableType, indexPath: IndexPath)
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int
    
}

extension TablePresenterProtocol {
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {}
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int { return 44 }
}

protocol TablePresenterDelegate: class {
    func dataSourceUpdated()
}
