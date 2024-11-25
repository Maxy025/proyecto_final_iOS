//
//  DatosPokemonViewController.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/22/24.
//

import UIKit

class DatosPokemonViewController: UIViewController {
    
    var mostrar_info_pokemon: Datos?
    
    
    @IBOutlet weak var imagenPokemon: UIImageView!
    @IBOutlet weak var detallesPokemon: UITextView!
    @IBOutlet weak var tipoPokemon: UILabel!
    @IBOutlet weak var ataquePokemon: UILabel!
    @IBOutlet weak var defensaPokemon: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cargar la imagen del pokemon
        
        imagenPokemon.loadFrom(URLAddres: mostrar_info_pokemon?.imageUrl ?? "")
        tipoPokemon.text = "Type: \(mostrar_info_pokemon?.type ?? "")"
        ataquePokemon.text = "Attack: \(mostrar_info_pokemon!.attack)"
        defensaPokemon.text = "Defense: \(mostrar_info_pokemon!.defense)"
        detallesPokemon.text = "\(mostrar_info_pokemon?.description ?? "")"

    }
    
}

extension UIImageView {
    func loadFrom(URLAddres: String) {
        guard let url = URL(string: URLAddres) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
        .resume()
    }
}
