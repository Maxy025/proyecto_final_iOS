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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla_pokemones.delegate = self
        tabla_pokemones.dataSource = self
    }
}
//Codigo tablas
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tabla_pokemones.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = "Gardevoir"
        return celda
        
    }

    
}


