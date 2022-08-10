//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Rumeysa TAN on 10.08.2022.
//

import Foundation

class NetworkManager {
    static let networkManager = NetworkManager()
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
}
