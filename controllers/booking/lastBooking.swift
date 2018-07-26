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
  
    var refresher : UIRefreshControl!
    
    
    @IBOutlet weak var phone1Lbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var paymentWayLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var numOfGuests: UILabel!
    @IBOutlet weak var bleelaLbl: UILabel!
    @IBOutlet weak var dyafaLbl: UILabel!
    @IBOutlet weak var timeOnDay2: UILabel!
    @IBOutlet weak var endedAt: UILabel!
    @IBOutlet weak var startedAt: UILabel!
    @IBOutlet weak var timeOndayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var idGenratorLbl: UILabel!
    @IBOutlet weak var bleelaImage: UIImageView!
    @IBOutlet weak var bigView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        guard let bl_name = helper.getBL_name()
            
            else {
               
                return
        }
        guard let started_At = helper.getstarted_at()
            
            else {
               
                return
        }
        guard let ended_At = helper.getended_at()
            
            else {
               
                return
        }
    
        startedAt.text = started_At
        endedAt.text = ended_At
        timeOnDay2.text = bl_name
        timeOndayLbl.text = bl_name
        
        //         setup refresher
      bigView.layer.cornerRadius = 15
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (lastBooking.handleRefresh), for: UIControlEvents.valueChanged)

        // Do any additional setup after loading the view.
        bigView.backgroundColor = UIColor(red:0.27, green:0.80, blue:0.46, alpha:1.0)
    }
    @objc private func handleRefresh() {
        API.getLastBooking{ (error: Error?, blooks:[id]?) in
            if let blooks = blooks {
                self.memo = blooks
                self.idGenratorLbl.text = String (blooks.first!.b_id_generator)
                self.dateLbl.text = blooks.first!.b_date
                
                if blooks.first!.b_belela == String (1)
                {
                    self.bleelaLbl.text = "بليلة"
                }
                else
                {
                    self.bleelaLbl.isHidden = true
                    self.bleelaImage.isHidden = true
                }
                if blooks.first!.b_deafa == String (1)
                {
                    self.dyafaLbl.text = "+  الضيافة التراثية الحجازية"
                }
                else
                {
                    self.dyafaLbl.isHidden = true
                }
                self.numOfGuests.text = String (blooks.first!.b_num_of_guests)
                self.costLbl.text = String (blooks.first!.b_cost)
                if blooks.first!.b_payment_way == "cash" {
                    self.paymentWayLbl.text = "نقدا"
                }
                else{
                    self.paymentWayLbl.text = "حوالة بنكية"
                }
                self.nameLbl.text = blooks.first!.b_name
                self.phone1Lbl.text = blooks.first!.b_phone1
                
                if let refresher = self.refresher {
                    self.refresher.endRefreshing()
                }
                
                
            }
        }
        
    }
    
}
