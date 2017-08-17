//
//  CellparseTableViewCell.swift
//  Training
//
//  Created by alex on 8/17/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit

class CellparseTableViewCell: UITableViewCell {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nombre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
