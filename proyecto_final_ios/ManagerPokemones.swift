//
//  ManagerPokemones.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/11/24.
//

import Foundation

struct Pokemon : Codable{
    var results: [PokemonInfo]
}

struct PokemonInfo : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
}

class PokeApi  {
    func getData(completar:@escaping ([PokemonInfo]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let listaPokemon = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completar(listaPokemon.results)
            }
        }.resume()
    }
}
