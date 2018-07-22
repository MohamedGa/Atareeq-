//
//  modules.swift
//  Atareque
//
//  Created by Mohammed Gamal on 6/27/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//

import UIKit
class bookingHistory : NSObject {
   
    var b_status :String = ""
    var b_name: String = ""
    var  b_date: String = ""
    var b_payment_way :String = ""
    var b_num_of_guests: Int = 0
    var  bl_name: String = ""
    var bl_started_at :String = ""
    var bl_ended_at: String = ""
    var  b_id_generator: Int = 0
    var b_cost :Int = 0
    var b_payment_receipt: String = ""
  
}
class availableTimeBlooks: NSObject {
    var bl_name : String = ""
    var bl_started_at : String = ""
    var bl_ended_at : String = ""
    var b_flag : String = ""
    var bl_price : Int = 0
    
}
class list2 : NSObject {
    
}
class constraints: NSObject {
    var c_constraint : String = ""
}
