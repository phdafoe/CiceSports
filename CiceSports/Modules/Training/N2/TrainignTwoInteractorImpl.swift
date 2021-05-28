// TrainignTwoInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainignTwoInteractorProtocol {
    
}

class TrainignTwoInteractorImpl: BaseInteractor<TrainignTwoPresenterProtocol> {
    
    var provider: TrainignTwoProviderProtocol = TrainignTwoProviderImpl()
    
}

extension TrainignTwoInteractorImpl: TrainignTwoInteractorProtocol {
    
}
