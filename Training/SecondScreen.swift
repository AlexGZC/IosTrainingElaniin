//
//  SecondScreen.swift
//  Training
//
//  Created by alex on 8/14/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class SecondScreen:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var get: UILabel!
     var Labelstext = String()
    var datos = [UsersFirebase]()
   
  
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        get.text = "Bienvenido "+Labelstext
        
        ref = Database.database().reference()
        handle = ref?.child("artist").observe(.childAdded, with: { (data) in
            if let item = data.value as? UsersFirebase
            {
                self.datos.append(item)
                DispatchQueue.main.async(execute: {
                self.tabla.reloadData()
                })
                print("sss",self.tabla.reloadData())
            }
        })
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell{
    let celdaidentificador = "datafire"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: celdaidentificador, for: indexPath) as?
    Cellparse else{
    fatalError("La instancia de la celda no funciona")
    }
    let cargar = datos[indexPath.row]
    
    cell.email.text = cargar.genre
    cell.nombre.text = String(cargar.name)
    
    return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datos.count
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

