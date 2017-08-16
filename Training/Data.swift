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


//MARK: Initialization

init?(name: String) {
    
    // The name must not be empty
    guard !name.isEmpty else {
        return nil
    }
    
  
    self.name = name
  
    
}
}
