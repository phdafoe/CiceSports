// TrainignTwoPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainignTwoPresenterProtocol {
   
}

class TrainignTwoPresenterImpl: BasePresenter<TrainignTwoViewControllerProtocol, TrainignTwoRouterProtocol> {
    
    var interactor: TrainignTwoInteractorProtocol?
    
}


extension TrainignTwoPresenterImpl: TrainignTwoPresenterProtocol {
    
  
}
