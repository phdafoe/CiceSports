//
//  ResponseMenuModel.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation

// MARK: - ResponseMenuModel
struct ResponseMenuModel: Codable {
    let menuResponse: [MenuResponse]?

    enum CodingKeys: String, CodingKey {
        case menuResponse = "menuResponse"
    }
}

// MARK: - MenuResponse
struct MenuResponse: Codable {
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

// MARK: - Menu
struct Menu: Codable {
    let imagen: String?
    let literal: String?

    enum CodingKeys: String, CodingKey {
        case imagen = "imagen"
        case literal = "literal"
    }
}
