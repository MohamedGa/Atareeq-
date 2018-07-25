//
//  fifthBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/25/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit

class fifthBooking: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate{
    @IBOutlet weak var textPicker: UITextField!
    @IBOutlet weak var fullName: UITextField!
   
    @IBOutlet weak var firstPhoneNumber: UITextField!
    @IBOutlet weak var seondPhoneNumber: UITextField!
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var nextPage: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    var list = ["نقدا","حوالة بنكية"]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "< رجوع", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.rightBarButtonItem = backButton
        //change the color of title navigation
        let textAttributes = [NSForegroundColorAttributeName:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        pickerView.delegate = self
        pickerView.dataSource = self
        textPicker.delegate = self
        pickerView.isHidden = true
        fullName.layer.cornerRadius = 18
        fullName.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        firstPhoneNumber.layer.cornerRadius = 18
        firstPhoneNumber.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        seondPhoneNumber.layer.cornerRadius = 18
        seondPhoneNumber.backgroundColor = UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        paymentView.layer.cornerRadius = 13
        paymentView.backgroundColor = UIColor(red:0.27, green:0.80, blue:0.46, alpha:1.0)
        pickerView.setValue(UIColor.green, forKeyPath: "textColor")
        textPicker.text = list[0]
        nextPage.layer.cornerRadius = 11
        nextPage.backgroundColor =  UIColor(red:0.81, green:0.21, blue:0.10, alpha:1.0)
        

        // Do any additional setup after loading the view.
    }
    func backTapped(sender: AnyObject) {
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
        self.pickerView.isHidden = true
       
    }
   
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.textPicker {
            
            self.pickerView.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
            
            
            
        }
    }
    @IBAction func nextPageTapped(_ sender: Any) {
        guard let fullName = fullName.text, !fullName.isEmpty else {return}
        guard let phone1 = firstPhoneNumber.text, !phone1.isEmpty else {return}
        guard let phone2 = seondPhoneNumber.text, !phone2.isEmpty else {return}
        var payment = textPicker.text
        var paymentWay : String
        if payment == list[0]
        {
            paymentWay = "cash"
        }
        else{
            paymentWay = "bank"
            }
        let def = UserDefaults.standard
        def.setValue(paymentWay, forKey: "b_payment_way")
        def.setValue(fullName, forKey: "b_name")
        def.setValue(phone1, forKey: "b_phone1")
        def.setValue(phone2, forKey: "b_phone2")
        def.synchronize()
        
        self.performSegue(withIdentifier: "lastBooking", sender: self)
    }
    
}
