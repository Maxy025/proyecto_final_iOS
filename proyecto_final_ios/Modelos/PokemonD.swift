//
//  PokemonD.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/11/24.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    let id: Int
    let attack: Int
    let name: String
    let imageURL: String
}
