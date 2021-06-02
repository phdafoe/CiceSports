//
//  AlertDefaultViewModel.swift
//  CiceSports
//
//  Created by cice on 01/06/2021.
//

import Foundation

@objc enum DefaultAlertType: Int {
    case confirmationNavigation
    case none
}

struct AlertDefaultViewModel {
    var type: DefaultAlertType?
    
    //Confirmation Navigation
    var confirmationTitle = LocalizedKeys.General.titleAlertDefault
    var confirmationMessage = LocalizedKeys.General.messageAlertDefault
    var confirmationPrimaryButton = LocalizedKeys.General.primaryButtonAlertDefault
    
    init(type: DefaultAlertType){
        self.type = type
    }
}
