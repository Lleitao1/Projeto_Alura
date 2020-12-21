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
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    //construtor
    init(nome: String,_ felicidade: Int,_ itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
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
