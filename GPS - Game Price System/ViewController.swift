//
//  ViewController.swift
//  conectaCloudant
//
//  Created by Student on 17/11/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCloudant: UILabel!
    
    @IBAction func btnCloudant(_ sender: Any) {
        /*CarroDAO.getCarros { (carro) in
            self.txtCloudant.text = String(describing: carro.nome)
        }*/
        //CarroDAO.falaTexto(texto: txtCloudant.text!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

