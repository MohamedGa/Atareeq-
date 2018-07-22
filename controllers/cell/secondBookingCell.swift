//
//  secondBookingCell.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/15/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class secondBookingCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blookName: UILabel!
    @IBOutlet weak var startedAt: UILabel!
    @IBOutlet weak var endedAt: UILabel!
    @IBOutlet weak var timeStack: UIStackView!
    
    @IBOutlet weak var nextLabel: UILabel!
    
    @IBOutlet weak var timeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.addShadow(cornerRadius: 10)
        self.backgroundColor = UIColor.clear
        self.contentView.addShadow(cornerRadius: 5,
                                   shadowRadius: 2,
                                   shadowColor: UIColor.black,
                                   opacity: 0.5)
        self.timeView.addShadow(cornerRadius: 5, shadowRadius: 2, shadowColor: UIColor.black, opacity: 0.5)
       // self.nextLabel.addShadow(cornerRadius: 3, shadowRadius: 1, shadowColor: UIColor.black, opacity: 0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
