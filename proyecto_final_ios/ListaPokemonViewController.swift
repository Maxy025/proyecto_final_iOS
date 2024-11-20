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
    }
}
//Codigo tablas
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tabla_pokemones.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell
        celda.nombrePokemon.text = "Gardevoir"
        celda.ataquePokemon.text = "55"
        celda.defensaPokemon.text = "39"
        
        celda.imagenPokemon.image = UIImage(named:"282")
        return celda
        
    }

    
}


