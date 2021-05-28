// TrainingTwoPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingTwoPresenterProtocol {
   
}

class TrainingTwoPresenterImpl: BasePresenter<TrainingTwoViewControllerProtocol, TrainingTwoRouterProtocol> {
    
    var interactor: TrainingTwoInteractorProtocol?
    
}


extension TrainingTwoPresenterImpl: TrainingTwoPresenterProtocol {
    
  
}
