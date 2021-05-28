// MenuPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuPresenterProtocol {
   
}

class MenuPresenterImpl: BasePresenter<MenuViewControllerProtocol, MenuRouterProtocol> {
    
    var interactor: MenuInteractorProtocol?
    
    var datamenu: [MenuResponse] = []
    
}


extension MenuPresenterImpl: MenuPresenterProtocol {
    
  
}
