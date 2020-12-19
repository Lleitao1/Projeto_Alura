//
//  ViewController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 18/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

//
//  ViewController.swift
//  teste
//
//  Created by Lucas Abdel Leitao on 16/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController : RefeicoesTableViewController?
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any){
        
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao( nome: nomeDaRefeicao, felicidade: felicidade)
        
        print(" voce adicionou \(refeicao.nome) com felicidade \(refeicao.felicidade)")
        
        tableViewController?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
        //```TableViewController?.add(refeicao)
        
        
        
    }
}

