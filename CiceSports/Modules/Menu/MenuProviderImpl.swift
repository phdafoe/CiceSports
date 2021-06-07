// MenuProvider.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import Combine

protocol MenuProviderProtocol {
    func fetchConsejos(completionHandler: @escaping (Result<ResponseConsejosModel, NetworkingError>) -> ())
}

class MenuProviderImpl: MenuProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchConsejos(completionHandler: @escaping (Result<ResponseConsejosModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointConsejosDeportes,
                                 urlContext: .heroku)
        
        self.provider.requestGeneric(requestDto: request, entityClass: ResponseConsejosModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] responseConsejosModel in
            guard self != nil else { return }
            completionHandler(.success(responseConsejosModel))
        }.store(in: &cancellable)
    }
    
}


