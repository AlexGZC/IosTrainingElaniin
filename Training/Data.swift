//
//  Data.swift
//  Training
//
//  Created by alex on 8/15/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import UIKit
class Data {
    

var name: String
var telefono: Int


//MARK: Initialization

init?(name: String, telefono: Int) {
    
    // The name must not be empty
    guard !name.isEmpty else {
        return nil
    }
    
  
    self.name = name
    
    self.telefono = telefono
  
    
}
}
