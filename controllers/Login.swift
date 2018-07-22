//
//  Login.swift
//  Atareque
//
//  Created by Mohammed Gamal on 6/25/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import Foundation
import XLPagerTabStrip
import Alamofire
import SwiftyJSON



class Login: UIViewController , IndicatorInfoProvider , UITextFieldDelegate{
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Login")
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else {return}
        guard let password = passwordTF.text, !password.isEmpty else {return}
        
        API.login(email: email, password: password) { (error: Error? , success : Bool) in
            if success {
                print("OK")
                
                self.goToHomePage()
            }
            else
            {
                print("notOK")
            }
        }
    }
    func goToHomePage() {
        guard let window = UIApplication.shared.keyWindow else { return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc : UIViewController
        vc = sb.instantiateViewController(withIdentifier: "SWRevealViewController")
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


