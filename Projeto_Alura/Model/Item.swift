//
//  Item.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 18/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    //atributos
    var nome: String
    var calorias: Double
    
    //construtor
    init(_ nome: String,_ calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
