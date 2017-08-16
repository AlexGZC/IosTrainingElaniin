//
//  Celda.swift
//  Training
//
//  Created by alex on 8/15/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import UIKit

class Celda: UITableViewCell{
    
    
    
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var titulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
