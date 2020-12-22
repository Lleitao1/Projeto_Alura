//
//  RemoveRefeicoesController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 22/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import Foundation
import UIKit

class RemoveRefeicoesViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe (_ refeicao: Refeicao, handler: @escaping (UIAlertAction)-> Void){
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let cancelarBotao = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(cancelarBotao)
        
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive,
            handler: handler)
        
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }

}
