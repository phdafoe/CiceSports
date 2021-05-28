//
//  RequestManager.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, ApiError>
}

class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, ApiError> where T: Decodable {
        
        let endpoint = requestDto.endpoint
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        let headers = AppAssembly.defaultHTTPHeaders
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { error -> ApiError in
                ApiError.unknow
            }
            .flatMap { data, response -> AnyPublisher<T, ApiError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknow).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error  in
                            ApiError.unknow
                        }
                        .eraseToAnyPublisher()
                } else {
                    let error = ApiError.unknow
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}