//
//  RequestManager.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError>
}

class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError> where T: Decodable {
        
        let baseUrl = URLEndpoint.getUrlBase(urlContext: requestDto.urlContext)
        let endpoint = "\(baseUrl)\(requestDto.endpoint)"
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        let headers = AppAssembly.defaultHTTPHeaders
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { error -> NetworkingError in
                NetworkingError(error: error)
            }
            .flatMap { data, response -> AnyPublisher<T, NetworkingError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NetworkingError(status: .badRequest)).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error  in
                            NetworkingError(status: .accepted)
                        }.eraseToAnyPublisher()
                } else {
                    let error = NetworkingError(errorCode: httpResponse.statusCode)
                    return Fail(error: NetworkingError(error: error)).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
