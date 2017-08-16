//
//  SecondScreen.swift
//  Training
//
//  Created by alex on 8/14/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import UIKit

class SecondScreen: UIViewController{
    @IBOutlet weak var recibir: UILabel!
    var Labelstext = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recibir.text = "Bienvenido "+Labelstext
        
    }
    
    
}
