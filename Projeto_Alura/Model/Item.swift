//
//  Item.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 18/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class Item: NSObject {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
