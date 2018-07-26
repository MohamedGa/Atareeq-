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
    class func getPaymentWay() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_payment_way") as? String
        
    }
    class func getNumofGuests() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_num_of_guests") as? String
        
    }
    class func getBleela() -> Int? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_belela") as? Int
        
    }
    class func getDyafa() -> Int? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_deafa") as? Int
        
    }
    class func getBlockID() -> Int? {
        let def = UserDefaults.standard
        return def.object(forKey: "block_id") as? Int
        
    }
    class func getCost() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_cost") as? String
        
    }
    class func getBookName() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_name") as? String
        
    }
    class func getPhone1() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_phone1") as? String
        
    }
    class func getPhone2() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "b_phone2") as? String
        
    }
    class func getBL_name() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "bl_name") as? String
        
    }
    class func getstarted_at() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "started_at") as? String
        
    }
    class func getended_at() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "ended") as? String
        
    }

}
