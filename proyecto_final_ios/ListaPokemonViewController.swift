//
//  ViewController.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/8/24.
//

import UIKit

class ListaPokemonViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var barra_buscadora_pokemones: UISearchBar!
    @IBOutlet weak var tabla_pokemones: UITableView!
    
    var pokemonManager = PokemonManager()
    var pokemones_array : [Datos] = []
    var pokemon_seleccionado: Datos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla_pokemones.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        pokemonManager.delegado = self
        
        tabla_pokemones.delegate = self
        tabla_pokemones.dataSource = self
        
        //Mostramos la lista de los pokemones
        pokemonManager.verPokemon()
            
        }
    }
//Pokemon delegado
extension ListaPokemonViewController: pokemonManagerDelegado{
    func mostrarListaPokemon(lista: [Datos]) {
        pokemones_array = lista
        
        DispatchQueue.main.async {
            self.tabla_pokemones.reloadData()
        }
    }
}
//Codigo tablas
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemones_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tabla_pokemones.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell
        celda.nombrePokemon.text = pokemones_array[indexPath.row].name
        celda.ataquePokemon.text = "Attack: \(pokemones_array[indexPath.row].attack)"
        celda.defensaPokemon.text = "Defense: \(pokemones_array[indexPath.row].defense)"
        
        if let urlString = pokemones_array[indexPath.row].imageUrl as? String{
            if let imagenUrl = URL(string: urlString){
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenUrl) else{
                        return
                    }
                        let image = UIImage(data: imagenData)
                    DispatchQueue.main.async{
                        celda.imagenPokemon.image = image
                    }
                        
                }
            }
        }
        return celda
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemon_seleccionado = pokemones_array[indexPath.row]
        performSegue(withIdentifier: "verDatosPokemon", sender: self)
        tabla_pokemones.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verDatosPokemon"{
            let verDatosPokemon = segue.destination as! DatosPokemonViewController
            verDatosPokemon.mostrar_info_pokemon = pokemon_seleccionado
        }
    }
}


