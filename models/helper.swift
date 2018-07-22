//
//  helper.swift
//  Budgets
//
//  Created by Mohammed Gamal on 5/27/18.
//  Copyright © 2018 codelabs. All rights reserved.
//

import UIKit

class helper: NSObject {
    
    class func saveEmail(token: String){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "email")
        def.synchronize()
    }
    class func getEmail() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "email") as? String
        
    }
    class func getBookDate() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_date") as? String
        
    }

}
