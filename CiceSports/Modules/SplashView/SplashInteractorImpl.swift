//
//  SplashInteractorImpl.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation


protocol SplashInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(ApiError?) -> ())
}


class SplashInteractorImpl: BaseInteractor<SplashPresenterProtocol> {
    
    var provider: SplashProviderProtocol = SplashProviderImpl()
    
}


extension SplashInteractorImpl: SplashInteractorProtocol {
    
    internal func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(ApiError?) -> ()) {
        self.provider.fetchMenu { [weak self] (result) in
            guard self != nil else { return }
            switch result{
            case .success(let respose):
                success(respose.menuResponse)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    
}
