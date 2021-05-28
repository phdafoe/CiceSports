// MenuProvider.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import Combine

protocol MenuProviderProtocol {
    
}

class MenuProviderImpl: MenuProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    
    ///
    ///Ejemplo de petición con Combine OJO no borrar
    ///
    /*var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel, ApiError>) -> ()) {
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.baseUrl+URLEndpoint.endpointMenu)
        
        self.provider.requestGeneric(requestDto: request, entityClass: ResponseMenuModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] responseMenuModel in
            guard self != nil else { return }
            completionHandler(.success(responseMenuModel))
        }.store(in: &cancellable)
    }*/
    
}


