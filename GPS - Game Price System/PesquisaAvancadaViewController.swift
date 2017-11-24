//
//  PesquisaAvancadaViewController.swift
//  Aula07Prototipo
//
//  Created by Student on 13/11/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import UIKit



class PesquisaAvancadaViewController: UIViewController {
    
    @IBOutlet weak var labelTesteSwitch: UILabel!
    @IBOutlet weak var switchTeste: UISwitch!
   
    @IBAction func ligaPickerView(_ sender: Any) {
    }
    
    @IBAction func mudaLabel(_ sender: Any) {
        let onState = switchTeste.isOn
        
        if onState {
            labelTesteSwitch.text = "Switch is on"
        }
        else {
            labelTesteSwitch.text = "Off"
            
        }
    }
    
    var faixaEtaria = ["Livre","10 anos","12 anos","14 anos","16 anos","18 anos"]
    
    @IBOutlet weak var faixaEtariaPickerView: UIPickerView!{
        didSet {
            faixaEtariaPickerView.delegate = self
            faixaEtariaPickerView.dataSource = self
        }
    }
    
    @IBOutlet weak var generoLabel: UILabel!{
        didSet {
            generoLabel.text = "Faixa etaria selecionada:\(faixaSelecionada)"
        }
    }
    
    var faixaSelecionada: String {
        get {
            // Com o selectedRow(inComponent:) é possível saber qual
            // linha o usuário escolheu na Picker View
            return faixaEtaria[faixaEtariaPickerView.selectedRow(inComponent: 0)]
        }
    }
}


extension PesquisaAvancadaViewController: UIPickerViewDataSource, UIPickerViewDelegate  {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return faixaEtaria.count
        }
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return faixaEtaria[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            print(faixaSelecionada)
            generoLabel.text = "Faixa etaria: \(faixaSelecionada)"
        }
    
    }

   
