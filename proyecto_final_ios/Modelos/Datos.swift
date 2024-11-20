//
//  Datos.swift
//  proyecto_final_ios
//
//  Created by alumno on 11/20/24.
//
struct Datos: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
