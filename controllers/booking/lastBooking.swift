//
//  lastBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/25/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class lastBooking: UIViewController {
    var memo = [id]()
    var data :availableTimeBlooks?
    var refresher : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        // setup refresher
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (lastBooking.handleRefresh), for: UIControlEvents.valueChanged)

        // Do any additional setup after loading the view.
    }
    @objc private func handleRefresh() {
        API.getLastBooking{ (error: Error?, blooks:[id]?) in
            if let blooks = blooks {
                self.memo = blooks
                
                if let refresher = self.refresher {
                    self.refresher.endRefreshing()
                }
                
                
            }
        }
        
    }
    
}
