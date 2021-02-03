//
//  thirdBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/16/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class thirdBooking: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
    var bleela = 5
    var dyafa = 50
    var x :Int? = 0
    var y : Int? = 0
    var refresher : UIRefreshControl!
    var data :availableTimeBlooks?
    
    var list = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19","20", "21", "22", "23", "24", "25", "26", "27", "28", "29","30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
               "40", "41", "42", "43", "44", "45", "46", "47", "48", "49","50", "51", "52", "53", "54", "55", "56", "57", "58", "59","60", "61", "62", "63", "64", "65", "66", "67", "68", "69",
               "70", "71", "72", "73", "74", "75", "76", "77", "78", "79","80", "81", "82", "83", "84", "85", "86", "87", "88", "89","90", "91", "92", "93", "94", "95", "96", "97", "98", "99",
               "100", "101", "102", "103", "104", "105", "106", "107", "108", "109","110"]
//    var list2 = ["20", "21", "22", "23", "24", "25", "26", "27", "28", "29","30", "31", "32", "33", "34", "35", "36", "37", "38", "39",
//                 "40", "41", "42", "43", "44", "45", "46", "47", "48", "49","50", "51", "52", "53", "54", "55", "56", "57", "58", "59","60", "61", "62", "63", "64", "65", "66", "67", "68", "69",
//                 "70", "71", "72", "73", "74", "75", "76", "77", "78", "79","80", "81", "82", "83", "84", "85", "86", "87", "88", "89","90", "91", "92", "93", "94", "95", "96", "97", "98", "99",
//                 "100", "101", "102", "103", "104", "105", "106", "107", "108", "109","110"]
    @IBOutlet weak var textPicker: UITextField!
    @IBOutlet weak var dropdown: UIPickerView!
    @IBOutlet weak var numOfGuestsLbl: UILabel!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var sixView: UIView!
    @IBOutlet weak var sevenView: UIView!
    @IBOutlet weak var eightView: UIView!
    @IBOutlet weak var blookLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var bleelaSwitch: UISwitch!
    @IBOutlet weak var dyafaSwitch: UISwitch!
    @IBOutlet weak var pricePerPerson: UILabel!
    @IBOutlet weak var pricePerAllPersons: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "< رجوع", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.rightBarButtonItem = backButton
        //change the color of title navigation
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        handleRefresh()
       dropdown.delegate = self
        dropdown.dataSource = self
        textPicker.delegate = self
      dropdown.isHidden = true
        bleelaSwitch.isOn = false
        dyafaSwitch.isOn = false
        // put icon beside title in navigation
        var myView: UIView = UIView(frame: CGRect(0,0,120,30))
        var title: UILabel = UILabel(frame: CGRect(0, 0, 120, 30))
        title.text = "اختيار الحجز"
        title.textColor = UIColor.red
        title.font = UIFont.boldSystemFont(ofSize: 15.0)
        title.backgroundColor = UIColor.clear
        var image: UIImage = UIImage(named: "res")!
        var myImageView: UIImageView = UIImageView(image: image)
        myImageView.frame = CGRect(75, 0, 30, 30)
        myImageView.layer.cornerRadius = 5.0
        myImageView.layer.masksToBounds = true
        myImageView.layer.borderColor = UIColor.lightGray.cgColor
        myImageView.layer.borderWidth = 0.1
        myView.addSubview(myImageView)
        myView.backgroundColor = UIColor.clear
        myView.addSubview(title)
        
        self.navigationItem.titleView = myView
      
        // setup refresher
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "loading")
        refresher.addTarget(self, action: #selector (thirdBooking.handleRefresh), for: UIControlEvents.valueChanged)
        bigView.layer.cornerRadius = 11
        secondView.layer.cornerRadius = 11
        thirdView.layer.cornerRadius = 11
        fourthView.layer.cornerRadius = 11
        fifthView.layer.cornerRadius = 11
        sixView.layer.cornerRadius = 11
        sevenView.layer.cornerRadius = 11
        eightView.layer.cornerRadius = 11
        bigView.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        secondView.backgroundColor = UIColor(red:0.27, green:0.80, blue:0.46, alpha:1.0)
        thirdView.backgroundColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:1.0)
        fourthView.backgroundColor = UIColor(red:0.27, green:0.80, blue:0.46, alpha:1.0)
        sixView.backgroundColor = UIColor(red:0.99, green:0.78, blue:0.19, alpha:1.0)
        fifthView.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        blookLbl.text = data?.bl_name
        blookLbl.layer.borderColor = UIColor.red.cgColor;        blookLbl.layer.borderWidth = 4
        blookLbl.layer.masksToBounds = true
        blookLbl.layer.cornerRadius = 11
        nextBtn.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        nextBtn.layer.cornerRadius = 11
        let price = "\(String(describing: data!.bl_price))"
        pricePerPerson.text = price
        let blookId = data?.bl_id
        
      //  pricePerAllPersons.text = "\(0)"
       
        
        // Do any additional setup after loading the view.
        
        
        textPicker.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidEnd)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            let a:Int? = Int(textPicker.text!)
            let b:Int? = Int(pricePerPerson.text!)
        if  a != nil{
            let c:Int? = a! * b!

            self.pricePerAllPersons.text = String(c!)
        }
        
    }
    

    
    
    @objc func backTapped(sender: AnyObject) {
        // bact to last View Controller
        self.navigationController?.popViewController(animated: true)
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.textPicker.text = self.list[row]
        self.dropdown.isHidden = true
        let a:Int? = Int(self.textPicker.text!)
        let b:Int? = Int(self.self.pricePerPerson.text!)
        let c:Int? = a! * b!
        
        self.pricePerAllPersons.text = String(c!)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.textPicker {
            
            self.dropdown.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
            
            
            
        }
        
        
    }
    
    //    let a:Int? = Int(textPicker.text!)
//    let b:Int? = Int(pricePerPerson.text!)
//    let c:Int? = a! + b!
//
//    pricePerAllPersons.text = String(c!)
    
   
    @objc private func handleRefresh() {
        API.checkNumOfGuests{(error: Error?, success : Bool) in
            if success == true {
                self.numOfGuestsLbl.text = " الحد الادنى ٢٠ شخص والحد الاقصى ١١٠ شخص"
                self.textPicker.text = self.list[10]
                let a:Int? = Int(self.textPicker.text!)
                let b:Int? = Int(self.self.pricePerPerson.text!)
                let c:Int? = a! * b!
                
                self.pricePerAllPersons.text = String(c!)
                }
            else {
                self.numOfGuestsLbl.text = "الحد الادنى ١٠ اشخاص والحد الاقصي ١١٠ شخص"
                self.textPicker.text=self.list[0]
                let a:Int? = Int(self.textPicker.text!)
                let b:Int? = Int(self.pricePerPerson.text!)
                let c:Int? = a! * b!
                
                self.pricePerAllPersons.text = String(c!)
            }
                let refresher = self.refresher
                self.refresher.endRefreshing()
            
        }
    }
    

    @IBAction func bleelaOn(_ sender: Any) {
        if bleelaSwitch.isOn {
        let a:Int? = Int(pricePerPerson.text!)
        let b:Int? = Int(bleela)
        let c:Int? = a! + b!
            let f : Int? = Int(textPicker.text!)
        
            pricePerPerson.text = String(c!)
            let d:Int? = f! * c!
            pricePerAllPersons.text = String(d!)
            x = 1
        }
        else{
            let a:Int? = Int(pricePerPerson.text!)
            let b:Int? = Int(bleela)
            let c:Int? = a! - b!
            let f : Int? = Int(textPicker.text!)
            
            
            pricePerPerson.text = String(c!)
            let d:Int? = f! * c!
            pricePerAllPersons.text = String(d!)
            x = 0
        }
        
    }
    @IBAction func dyafaOn(_ sender: Any) {
        if dyafaSwitch.isOn {
            let a:Int? = Int(pricePerPerson.text!)
            let b:Int? = Int(dyafa)
            let c:Int? = a! + b!
            let f : Int? = Int(textPicker.text!)
            
            pricePerPerson.text = String(c!)
            let d:Int? = f! * c!
            pricePerAllPersons.text = String(d!)
            y = 1
           
            
        }
        else{
            let a:Int? = Int(pricePerPerson.text!)
            let b:Int? = Int(dyafa)
            let c:Int? = a! - b!
            
            let f : Int? = Int(textPicker.text!)
            pricePerPerson.text = String(c!)
            let d:Int? = f! * c!
            pricePerAllPersons.text = String(d!)
            y = 0
        }
       
    }
    @IBAction func nextPage(_ sender: Any) {
        guard let numOfGuests = textPicker.text, !numOfGuests.isEmpty else {return}
        API.checkNumOfGuests_ios(numOfGuests: numOfGuests){ (error: Error? , success : Bool) in
            if success == true {
                let priceAll = self.pricePerAllPersons.text
                let flag = self.x
                let yflag = self.y
                let blookId = self.data?.bl_id
                let mm = self.data
                let bl_name = self.data?.bl_name
                let started_at = self.data?.bl_started_at
                let ended = self.data?.bl_ended_at
                let def = UserDefaults.standard
                def.setValue(numOfGuests, forKey: "b_num_of_guests")
                def.setValue(priceAll, forKey: "b_cost")
                def.set(flag, forKey: "b_belela")
                def.set(yflag, forKey: "b_deafa")
                def.set(blookId, forKey: "block_id")
                def.set(bl_name, forKey: "bl_name")
                def.set(started_at, forKey: "started_at")
                def.set(ended, forKey: "ended")
                def.synchronize()
                 self.performSegue(withIdentifier: "fourth", sender: self)
            }
            if success == false {
                AlertManager.showAlert("عدد الضيوف غير صحيح", inViewController: self)
            }
    }
    
    
    
}
}

