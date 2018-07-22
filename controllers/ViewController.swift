//
//  ViewController.swift
//  Atareque
//
//  Created by Mohammed Gamal on 20/06/18.
//  Copyright © 2018 Mohammed Gamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
          //  btnMenuButton.target = revealViewController()
          //  btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
         //  revealViewController().rightViewRevealWidth = 150
           btnMenuButton.target = revealViewController()
           btnMenuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
          
      
            
            
        }
    }
    
    @IBAction func bookNow(_ sender: Any) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

