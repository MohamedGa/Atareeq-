//
//  firstBooking.swift
//  Atareque
//
//  Created by Mohammed Gamal on 7/8/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit


class firstBooking: UIViewController {
  
    @IBOutlet weak var dateTextField: UITextField!
    // setup date Piker
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
    
    let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(firstBooking.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
       
       // dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    func donePressed(sender: UIBarButtonItem) {
        
        dateTextField.resignFirstResponder()
        
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "yyyy-MM-dd"
        
      //  dateformatter.timeStyle = DateFormatter.Style.none
        
        dateTextField.text = dateformatter.string(from: NSDate() as Date)
        
        dateTextField.resignFirstResponder()
    }
    // setup date Piker
    func backTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "< رجوع", style: .plain, target: self, action: #selector(backTapped))
        navigationItem.rightBarButtonItem = backButton
        //change the color of title navigation
        let textAttributes = [NSForegroundColorAttributeName:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
       // tool bar of date piker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: self.view.frame.size.height/6))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.blackTranslucent
        
        toolBar.tintColor = UIColor.white
        
        toolBar.backgroundColor = UIColor.black
        
        
        let todayBtn = UIBarButtonItem(title: "Today", style: UIBarButtonItemStyle.plain, target: self, action: #selector(firstBooking.tappedToolBarBtn))
        
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(firstBooking.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clear
        
        label.textColor = UIColor.white
        
        label.text = "Select a due date"
        
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([todayBtn,flexSpace,textBtn,flexSpace,okBarBtn], animated: true)
        
        dateTextField.inputAccessoryView = toolBar

        // tool bar of date piker
        // Do any additional setup after loading the view.
        
        
    }

   
      
            
    @IBAction func nextButton(_ sender: Any) {
    
    
        guard let b_date = dateTextField.text, !b_date.isEmpty else {
            AlertManager.showAlert("please Enter the date", inViewController: self)
            return
            
        }
        let def = UserDefaults.standard
        def.setValue(b_date, forKey: "b_date")
        def.synchronize()
       
        self.performSegue(withIdentifier: "first", sender: self)
        
    }


}

// How to dismiss keyboard when touching anywhere outside UITextField 
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
