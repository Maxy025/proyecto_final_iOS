//
//  PokemonSeleccionado.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/13/24.
//

import Foundation
 
struct PokemonSeleccionado: Codable{
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String?
}

class PokemonSeleccionadoAPI  {
    func getData(url:String, completar:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemon_sprite = try! JSONDecoder().decode(PokemonSeleccionado.self, from: data)
            
            DispatchQueue.main.async {
                completar(pokemon_sprite.sprites)
            }
        }.resume()
    }
}
