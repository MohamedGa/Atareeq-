//
//  MenuCell.swift
//  Atareque
//
//  Created by Mohammed Gamal on 20/06/18.
//  Copyright © 2018 Mohammed Gamal. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var lblMenuname: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
