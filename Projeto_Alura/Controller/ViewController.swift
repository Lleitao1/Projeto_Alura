//
//  ViewController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 18/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate{
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource {
    
    //MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["molho de tomate", "queijo","orégano"]
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let LinhaTabela = indexPath.row
        let item = itens[LinhaTabela]
        
        celula.textLabel?.text = item
        
        return celula
    }
    
    //MARK: - IBActions
    @IBAction func adicionar(_ sender: Any){
        
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao( nome: nomeDaRefeicao, felicidade)
        
        print(" voce adicionou \(refeicao.nome) com felicidade \(refeicao.felicidade)")
        
        delegate?.add(refeicao)

        navigationController?.popViewController(animated: true)
        
        
        
    }
}

