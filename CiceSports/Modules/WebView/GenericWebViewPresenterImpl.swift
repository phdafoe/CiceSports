// GenericWebViewPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol GenericWebViewPresenterProtocol {
   
}

class GenericWebViewPresenterImpl: BasePresenter<GenericWebViewViewControllerProtocol, GenericWebViewRouterProtocol> {
    
    var interactor: GenericWebViewInteractorProtocol?
    
}


extension GenericWebViewPresenterImpl: GenericWebViewPresenterProtocol {
    
  
}
