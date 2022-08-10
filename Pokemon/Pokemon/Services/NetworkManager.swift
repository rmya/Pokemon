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
    var pokemon: Pokemon?
    
    func getAllPokemons(completion : @escaping ([PokemonEntry]) -> ()){
        URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            guard let data = data else {
                return
            }
            let pokemonList = try! JSONDecoder().decode(Pokemons.self, from : data)
            completion(pokemonList.results)
            
        }.resume()
    }
    
    func getPokemon(withUrl count: String, completion: @escaping (Pokemon) -> ()) {
        let requestURL = baseURL.appendingPathComponent(count)
        let request = URLRequest(url: requestURL)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                return
            }
            do{
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                self.pokemon = pokemon
                completion(pokemon)
            }catch{
                print(error.localizedDescription)
                return
            }
        }.resume()
    }

}
