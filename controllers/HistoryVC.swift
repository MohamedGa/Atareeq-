//
//  HistoryVC.swift
//  Atareque
//
//  Created by Mohammed Gamal on 6/28/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit
import Foundation

class HistoryVC: UIViewController {

   var selectedRowIndex = -1
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var menu: UIBarButtonItem!
    var memo = [bookingHistory]()
   var refresher : UIRefreshControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
        tableView2.dataSource = self
        tableView2.delegate = self
            revealViewController().rightViewRevealWidth = 220
       
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.rightRevealToggle(_:))
     
        // setup refresher
       
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (HistoryVC.handleRefresh), for: UIControlEvents.valueChanged)
        tableView2.addSubview(refresher)
    
    ///
       // self.tableView.register(HistoryCell.self, forCellReuseIdentifier: "HistoryCell")
        // tableView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
    
    
    }
    

@objc private func handleRefresh() {
    API.getBlookData{ (error: Error?, blooks_data:[bookingHistory]?) in
        if let blooks_data = blooks_data {
            self.memo = blooks_data
           
            if let refresher = self.refresher {
                self.refresher.endRefreshing()
            }
            
            self.tableView2.reloadData()
        }
    }
    
}
}
extension HistoryVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memo.count
   
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as!  HistoryCell
        let status = memo[indexPath.row].b_status
        cell.Date.text = memo[indexPath.row].b_date
        cell.blookName.text = memo[indexPath.row].bl_name
        cell.bookID.text = "\( memo[indexPath.row].b_id_generator)"
        cell.bookName.text = memo[indexPath.row].b_name
        cell.guestsNum.text = "\( memo[indexPath.row].b_num_of_guests)"
        cell.receiptNum.text = memo[indexPath.row].b_payment_receipt
        cell.cost.text = "\( memo[indexPath.row].b_cost)"
        cell.payment.text = memo[indexPath.row].b_payment_way
        if status == "booked"
        {
            cell.status.text = status
            cell.containerView.backgroundColor = UIColor.green
        }
        if status == "cancelled"
        {
            cell.status.text = status
            cell.containerView.backgroundColor = UIColor.red
        }
        if status == "pending"
        {
            cell.status.text = status
            cell.containerView.backgroundColor = UIColor.orange
        }
    
        return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            
            return 300 //Expanded
        }
       
        return 300//Not expanded
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRowIndex == indexPath.row {
            selectedRowIndex = -1
            
        } else {
            selectedRowIndex = indexPath.row
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


extension HistoryVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
}
}


