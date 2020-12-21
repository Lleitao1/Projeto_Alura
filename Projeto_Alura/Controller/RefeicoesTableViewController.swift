//
//  RefeicoesTableViewController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 19/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit


class delegate : UITableViewController, AdicionaRefeicaoDelegate{
    
    //MARK: - List
    var refeicoes = [Refeicao(nome: "Bolo", 4 ),
                     Refeicao(nome: "Pizza", 5 ),
                     Refeicao(nome: "Comida Japonesa", 3)]
    
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
        //recarregar tela para mostrar o alimento adicionado
        tableView.reloadData()
        }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else{return}
            
            let refeicao = refeicoes[indexPath.row]
            
            let alerta = UIAlertController(title: refeicao.nome, message: "felicidade: \(refeicao.felicidade)", preferredStyle: .alert)
            
            let cancelarBotao = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            
            alerta.addAction(cancelarBotao)
            present(alerta, animated: true, completion: nil)
        }
    }

    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.delegate = self
        }
    }
}



