//
//  Refeicao.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 18/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    
    //atributos
    var nome: String
    var felicidade: Int
    var itens: Array<Item> = []
    
    //construtor
    init(nome: String,_ felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    //Metodo para calcular total de calorias dos itens adicionados
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}
