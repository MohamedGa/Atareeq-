//
//  secondBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/10/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

class secondBooking: UIViewController {
  var selectedRowIndex = -1
   var tito = [availableTimeBlooks]()
    var refresher : UIRefreshControl!
    @IBOutlet weak var tableView3: UITableView!
    func backTapped(sender: AnyObject) {
        // bact to last View Controller
        self.navigationController?.popViewController(animated: true)
    }
//    func buttonTapped(_ sender:UIButton!){
//        
//        //self.performSegue(withIdentifier: "secondSegue", sender: sender)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView3.addShadow(cornerRadius: 5, shadowRadius: 2, shadowColor: UIColor.black, opacity: 0.5)
        self.tableView3.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        handleRefresh()
        tableView3.dataSource = self
        tableView3.delegate = self
        // hide the back Item navigation
        navigationItem.hidesBackButton = true
        // creat new back button in right side
        let backButton = UIBarButtonItem(title: "< رجوع", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.rightBarButtonItem = backButton
        let textAttributes = [NSForegroundColorAttributeName:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        // Do any additional setup after loading the view.
      
        // setup refresher
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (secondBooking.handleRefresh), for: UIControlEvents.valueChanged)
        tableView3.addSubview(refresher)
    }
    @objc private func handleRefresh() {
        API.getAvailableTimeBlooks{ (error: Error?, blooks:[availableTimeBlooks]?) in
            if let blooks = blooks {
                self.tito = blooks
                
                if let refresher = self.refresher {
                    self.refresher.endRefreshing()
                }
                
                self.tableView3.reloadData()
            }
        }
        
    }
    
}
extension secondBooking: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tito.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondBookingCell", for: indexPath) as!  secondBookingCell
        let status = tito[indexPath.row].b_flag
        cell.blookName.text = tito[indexPath.row].bl_name
        cell.startedAt.text = tito[indexPath.row].bl_started_at
        cell.endedAt.text = tito[indexPath.row].bl_ended_at
        
        if status == "1"
        {
                        cell.timeView.backgroundColor = UIColor.darkGray
                        cell.containerView.backgroundColor = UIColor.lightGray
                        cell.blookName.backgroundColor = UIColor.white
                        cell.isUserInteractionEnabled = false
                        cell.nextLabel.text = "محجوز"
                        cell.nextLabel.textColor = UIColor.white
                        cell.nextLabel.backgroundColor = UIColor.darkGray
                        cell.nextLabel.layer.masksToBounds = true
                        cell.nextLabel.layer.cornerRadius = 7
            
           // cell.nextButton.tag = indexPath.row //or value whatever you want (must be Int)
          // cell.nextButton.addTarget(self, action: #selector(secondBooking.buttonTapped(_:)), for: UIControlEvents.touchUpInside)
        }
        if status == "0"
        {
            cell.timeView.backgroundColor = UIColor(red:0.27, green:0.80, blue:0.46, alpha:1.0)
            cell.containerView.backgroundColor = UIColor.white
            cell.blookName.textColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
            cell.nextLabel.text = "آحجز"
            cell.nextLabel.textColor = UIColor.white
            cell.nextLabel.backgroundColor = UIColor(red:0.27, green:0.80, blue:0.46, alpha:1.0)
            cell.nextLabel.layer.masksToBounds = true
            cell.nextLabel.layer.cornerRadius = 7

        }
       
        
        return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            
            return 200 //Expanded
        }
        
        return 200//Not expanded
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let selectedIndex = indexPath.row
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let budgetViewController = segue.destination as? thirdBooking {
            budgetViewController.data = tito[(tableView3.indexPathForSelectedRow?.row)!]
        }
    }
}

extension secondBooking : UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
