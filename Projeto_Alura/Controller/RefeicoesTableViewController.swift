//
//  RefeicoesTableViewController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 19/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit


class RefeicoesTableViewController : UITableViewController {
    
    var refeicoes = [Refeicao(nome: "Bolo",felicidade: 4),
                     Refeicao(nome: "Pizza",felicidade: 5),
                     Refeicao(nome: "Comida Japonesa", felicidade: 3)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        
        return celula
        
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.tableViewController = self
        }
    }
}



