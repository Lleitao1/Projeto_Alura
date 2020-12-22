//
//  Alerta.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 22/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import Foundation
import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init (controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe (titulo: String, mensagem: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present (alerta, animated: true, completion: nil)
    }
}
