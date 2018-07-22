//
//  HistoryCell.swift
//  Atareque
//
//  Created by Mohammed Gamal on 6/28/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var blookName: UILabel!
    @IBOutlet weak var bookID: UILabel!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var guestsNum: UILabel!
    @IBOutlet weak var receiptNum: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var payment: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addShadow(cornerRadius: 10)
        self.backgroundColor = UIColor.clear
        self.contentView.addShadow(cornerRadius: 5,
                                   shadowRadius: 2,
                                   shadowColor: UIColor.black,
                                   opacity: 0.5)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
