// TrainingOnePresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOnePresenterProtocol {
   
}

class TrainingOnePresenterImpl: BasePresenter<TrainingOneViewControllerProtocol, TrainingOneRouterProtocol> {
    
    var interactor: TrainingOneInteractorProtocol?
    
}


extension TrainingOnePresenterImpl: TrainingOnePresenterProtocol {
    
  
}
