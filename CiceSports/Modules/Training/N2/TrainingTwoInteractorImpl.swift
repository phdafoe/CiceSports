// TrainingTwoInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingTwoInteractorProtocol {
    
}

class TrainingTwoInteractorImpl: BaseInteractor<TrainingTwoPresenterProtocol> {
    
    var provider: TrainingTwoProviderProtocol = TrainingTwoProviderImpl()
    
}

extension TrainingTwoInteractorImpl: TrainingTwoInteractorProtocol {
    
}
