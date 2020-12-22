//
//  AdicionarItensViewController.swift
//  Projeto_Alura
//
//  Created by Lucas Abdel Leitao on 21/12/20.
//  Copyright © 2020 Lucas Abdel Leitao. All rights reserved.
//

import UIKit

protocol AdicionarItensDelegate{
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var NomeTextField: UITextField!
    @IBOutlet weak var CaloriasTextField: UITextField!
    
    //MARK: - Atributos
    var delegate: AdicionarItensDelegate?
    
    init(delegate: AdicionarItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBAction

    @IBAction func AdicionarItem(_ sender: Any) {
        guard let nome = NomeTextField?.text, let calorias = CaloriasTextField?.text else{return}
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome, numeroDeCalorias)
            
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    
    }
}
