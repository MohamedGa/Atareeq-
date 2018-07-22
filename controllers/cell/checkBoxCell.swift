//
//  checkBoxCell.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/22/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class checkBoxCell: UITableViewCell {

    @IBOutlet weak var btnChk: UIButton!
    
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
