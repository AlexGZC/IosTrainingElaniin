//
//  Parse.swift
//  Training
//
//  Created by alex on 8/17/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class Parse: UITableViewController, NVActivityIndicatorViewable  {
    @IBOutlet weak var carga: UIActivityIndicatorView!
    @IBOutlet var table: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          startAnimating(type: NVActivityIndicatorType.ballGridBeat)
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                self.stopAnimating()
                let swiftvar = JSON(responseData.result.value!)
                
                if let jsonvar = swiftvar["contacts"].arrayObject{
                    self.arrRes = jsonvar as! [[String:AnyObject]]
                    
                }
                if self.arrRes.count > 0{
                    self.table.reloadData()
                }
                
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }

    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaidentificador = "parse"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: celdaidentificador, for: indexPath) as?
            Cellparse else{
                fatalError("La instancia de la celda no funciona")
        }

        var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.nombre.text = dict["name"] as? String
        cell.email.text = dict["email"] as? String
       
        return cell
    }

   
}
