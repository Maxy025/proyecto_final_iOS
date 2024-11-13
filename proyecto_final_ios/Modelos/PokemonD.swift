//
//  PokemonD.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/11/24.
// https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation

struct PokemonInformacion: Decodable, Identifiable{
    let id: Int
    let attack: Int
    let name: String
    let imageURL: String
}
