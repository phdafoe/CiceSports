//
//  Utils.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation

enum ApiError: Error, LocalizedError {
    case unknow, apiError(reason: String)
    var errorDescription: String? {
        switch self {
        case .unknow:
            return "Unknown error"
        case .apiError(let error):
            return error
        }
    }
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}


public enum Environment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 2
}

struct RequestDTO {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    var urlContext: URLEndpoint.BaseURLContext
    var endpoint: String
    

    init(params: [String: Any]?, method: HTTPMethods, endpoint: String, urlContext: URLEndpoint.BaseURLContext) {
        self.params = params
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    

    init(arrayParams:[[String: Any]]?, method: HTTPMethods, endpoint: String, urlContext: URLEndpoint.BaseURLContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEndpoint {
    
    #if DEV
    static let environementDefault: Environment = Environment.DEV
    #elseif PRE
    static let environementDefault: Environment = Environment.PRE
    #else
    static let environementDefault: Environment = Environment.PRO
    #endif
    
    public enum BaseURLContext {
        case backend
        case heroku
    }
    
    static let baseUrl = "https://app-cicesport-123.herokuapp.com/"
    static let endpointMenu = "iCoMenuResponse"
    static let endpointConsejosDeportes = "iCoResponseConsejos"
}

extension URLEndpoint {
    
    static func getUrlBase(urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .DEV:
                return "https://app-herokuapp-des-cloudFirebase.com/"
            case .PRE:
                return "https://app-herokuapp-pre-cloudFirebase.com/"
            case .PRO:
                return "https://app-herokuapp-pro-cloudFirebase.com/"
            }
        case .heroku:
            switch self.environementDefault {
            case .DEV:
                return "https://app-herokuapp-des-cloudFirebase.com/"
            case .PRE:
                return "https://app-herokuapp-pre-cloudFirebase.com/"
            case .PRO:
                return "https://app-cicesport-123.herokuapp.com/"
            }
            
        }
    }
}


struct AuthHeroku {
    static let authHeroku = "Bearer 123456789"
}

