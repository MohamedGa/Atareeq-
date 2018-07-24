//
//  fourthBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/22/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class fourthBooking: UIViewController, UITableViewDataSource {
   var unchecked = true
    var memo = [constraints]()
   
   var refresher : UIRefreshControl!
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var nextBtnView: UIView!
    @IBOutlet weak var nextBrn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide the back Item navigation
        navigationItem.hidesBackButton = true
        // creat new back button in right side
        let backButton = UIBarButtonItem(title: "< رجوع", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.rightBarButtonItem = backButton
        let textAttributes = [NSForegroundColorAttributeName:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
       tableList.dataSource = self
        // Do any additional setup after loading the view.
        // setup refresher
        handleRefresh()
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (fourthBooking.handleRefresh), for: UIControlEvents.valueChanged)
        tableList.addSubview(refresher)
        tableList.layer.cornerRadius = 13
        tableList.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        nextBtnView.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        nextBrn.backgroundColor = UIColor.white
        nextBrn.layer.cornerRadius = 11
    }
    func backTapped(sender: AnyObject) {
        // bact to last View Controller
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func handleRefresh() {
        API.terms{ (error: Error?, terms:[constraints]?) in
            if let terms = terms {
                self.memo = terms
                
                if let refresher = self.refresher {
                    self.refresher.endRefreshing()
                }
                
                self.tableList.reloadData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkBoxCell")
        cell?.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        if let lbl = cell?.contentView.viewWithTag(1) as? UILabel {
            lbl.text = memo[indexPath.row].c_constraint
        }
        
        
        return cell!
    }
    @IBAction func checkAllBox(_ sender: UIButton) {
        if unchecked {
            sender.setImage(UIImage(named:"check-box.png"), for: .normal)
            unchecked = false
        }
        else {
            sender.setImage( UIImage(named:"empty-checkbox.png"), for: .normal)
            unchecked = true
        }
    }
    
    @objc func checkboxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
    }
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        
        
        
        if unchecked == false {
            self.performSegue(withIdentifier: "fifth", sender: self)
            self.nextBrn.isUserInteractionEnabled = true
        }
        if unchecked == true {
            self.nextBrn.isEnabled = false
        }
            self.nextBrn.isEnabled = true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
