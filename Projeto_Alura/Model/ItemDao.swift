//
//  ItemDao.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 22/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import Foundation

class ItemDao {
    
    func save(_ itens: [Item]){
        do {
            let dados = try  NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else {return}
            try dados.write(to: caminho)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func recupera()-> [Item]{
        do{
            guard let diretorio = recuperaDiretorio() else{return[]}
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            return itensSalvos
        }
        catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
