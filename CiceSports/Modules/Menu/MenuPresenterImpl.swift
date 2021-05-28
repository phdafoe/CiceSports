// MenuPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuPresenterProtocol {
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> Menu?
}

class MenuPresenterImpl: BasePresenter<MenuViewControllerProtocol, MenuRouterProtocol> {
    
    var interactor: MenuInteractorProtocol?
    var datamenu: [MenuResponse] = []
    
    internal func getNumberOfRowInSections() -> Int {
        self.datamenu.count
    }
    
    internal func getInformationObject(indexPath: Int) -> Menu? {
        self.datamenu[indexPath].menu
    }
    
}


extension MenuPresenterImpl: MenuPresenterProtocol {
    
  
}
