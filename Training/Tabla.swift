//
//  Tabla.swift
//  Training
//
//  Created by alex on 8/15/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import UIKit

class Tabla: UITableViewController{
    var datis = [Data]()
    
    override func viewDidLoad() {
        cargardata()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell{
        let celdaidentificador = "Carga"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: celdaidentificador, for: indexPath) as?
            Celda else{
                fatalError("La instancia de la celda no funciona")
        }
        let cargar = datis[indexPath.row]
        
        cell.titulo.text = cargar.name
    
        return cell
    }
    
    
    private func cargardata(){
        guard let carga1 = Data(name: "bskba") else{
            fatalError("error")
        }
        guard let carga2 = Data(name: "bskba") else{
            fatalError("error")
        }
        datis += [carga1,carga2]
        
    }
    
}