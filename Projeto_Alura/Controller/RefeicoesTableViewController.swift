//
//  RefeicoesTableViewController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 19/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//ZZ

import UIKit


class RefeicoesTableViewController : UITableViewController, AdicionaRefeicaoDelegate{
    
    //MARK: - List
    var refeicoes: [Refeicao] = []

    override func viewDidLoad() {
        refeicoes = RefeicaoDao().recupera()
    }
    
    //Numero de linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    //Uma celula por linha mostra um nome
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        celula.textLabel?.text = refeicao.nome
        
        return celula
        
    }
    
    //Adicionar refeicao à lista
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        RefeicaoDao().save(refeicoes)
        
        }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else{return}
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicoesViewController(controller: self).exibe(refeicao, handler:
                {Alert in
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.reloadData()
            })
            
        }
    }
    
    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}


