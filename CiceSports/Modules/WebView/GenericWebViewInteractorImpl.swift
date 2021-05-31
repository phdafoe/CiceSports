// GenericWebViewInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol GenericWebViewInteractorProtocol {
    
}

class GenericWebViewInteractorImpl: BaseInteractor<GenericWebViewPresenterProtocol> {
    
    var provider: GenericWebViewProviderProtocol = GenericWebViewProviderImpl()
    
}

extension GenericWebViewInteractorImpl: GenericWebViewInteractorProtocol {
    
}
