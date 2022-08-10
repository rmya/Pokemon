//
//  PokemonModels.swift
//  Pokemon
//
//  Created by Rumeysa TAN on 10.08.2022.
//

import Foundation

struct PokemonEntry: Codable {
    let name: String
    let url: String
}

struct Pokemons: Codable {
    var results: [PokemonEntry]
}

struct Stats: Decodable, Hashable {
    let base_stat: Int
}

struct sprites: Decodable, Hashable{
    let front_default: String
}

struct Pokemon: Decodable, Hashable, Identifiable{
    let id: Int
    let name: String
    let stats: [Stats]
    let sprites: sprites
}
//MARK: Encodable -> Bu protokolü kabul ettirdiğiniz class’lar veya struct’lar kendilerini JSON formatına çevirebilme özelliğine sahip olurlar.

// MARK: Decodable -> Bu protokolü kabul eden class veya struct’lar JSON türünden bir datayı kullanarak kendi türlerinden objeler oluşturabilirler.

// MARK: Codable -> Encodable ve Decodable protokollerinin birleşimidir. Bu protokolü kabul eden class ve struct’lar hem Encodable hem de Decodable protokollerini aynı anda kabul etmiş olur.
