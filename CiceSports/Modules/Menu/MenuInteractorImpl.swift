// MenuInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuInteractorProtocol {
    
}

class MenuInteractorImpl: BaseInteractor<MenuPresenterProtocol> {
    
    var provider: MenuProviderProtocol = MenuProviderImpl()
    
}

extension MenuInteractorImpl: MenuInteractorProtocol {
    
}
