//
//  fourthBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/22/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class fourthBooking: UIViewController, UITableViewDataSource {
   
    var memo = [constraints]()
   var refresher : UIRefreshControl!
    @IBOutlet weak var tableList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       tableList.dataSource = self
        // Do any additional setup after loading the view.
        // setup refresher
        handleRefresh()
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (fourthBooking.handleRefresh), for: UIControlEvents.valueChanged)
        tableList.addSubview(refresher)
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
        
        if let lbl = cell?.contentView.viewWithTag(1) as? UILabel {
            lbl.text = memo[indexPath.row].c_constraint
        }
        
        if let btnChk = cell?.contentView.viewWithTag(2) as? UIButton {
            btnChk.addTarget(self, action: #selector(checkboxClicked(_ :)), for: .touchUpInside)
        }
        return cell!
    }
    
    @objc func checkboxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
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
