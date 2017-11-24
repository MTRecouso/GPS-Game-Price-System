//
//  OfertaDAO.swift
//  GPS - Game Price System
//
//  Created by Student on 24/11/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//

import Foundation


class Oferta {
    var nome: String
    var preco: String
    
    
    init(json: [String: AnyObject]) {
        self.nome = json["nomeProduto"] as? String ?? "";
        self.preco = json["precoProduto"] as? String ?? "";
    }
}

class OfertaDAO {
    
    static func getOfertas(callback: @escaping (([Oferta]) -> Void)) {
        
        let endpoint: String = "https://gamepricingsystemendpoint.mybluemix.net/deals"
        
        guard let url = URL(string: endpoint) else {
            print("Error: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        print(json[0]["nomeProduto"]!)
                        
                        var filtered_json: [[String: AnyObject]] = [];
                        
                        for elem in json{
                            print(elem["nomeProduto"] as? String ?? "")
                            let elem_name : String = elem["nomeProduto"] as? String ?? ""
                            print(elem_name.lowercased())
                            if((elem_name.lowercased().range(of: "assassin")) != nil){
                                filtered_json.append(elem)
                            }
                        }
                        
                        print(filtered_json)
                        
                        var ofertas: [Oferta] = []
                        
                        for elem in filtered_json{
                            ofertas.append(Oferta(json: elem))
                        }
                        print(ofertas[0].nome)
                        
                        callback(ofertas)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }
    
}
