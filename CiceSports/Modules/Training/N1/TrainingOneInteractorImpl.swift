// TrainingOneInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOneInteractorProtocol {
    
}

class TrainingOneInteractorImpl: BaseInteractor<TrainingOnePresenterProtocol> {
    
    var provider: TrainingOneProviderProtocol = TrainingOneProviderImpl()
    
}

extension TrainingOneInteractorImpl: TrainingOneInteractorProtocol {
    
}
