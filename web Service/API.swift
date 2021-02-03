//
//  API.swift
//  Atareque
//
//  Created by Mohammed Gamal on 6/27/18.
//  Copyright © 2018 Parth Changela. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
   
    class func login ( email: String, password : String, completion: @escaping (_ error : Error?, _ success: Bool)->Void) {
        let url = "http://192.168.8.105/atareeg/public/api/loginUser"
        let parameters = ["email" :  email,
                          "password": password]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseJSON { responce in
                switch responce.result
                {
                case .failure(let error):
                    completion (error, false)
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    
                    let def = UserDefaults.standard
                    def.setValue(email, forKey: "email")
                    def.synchronize()
                    completion (nil, true)
                }
        }
    }
    class func getBlookData (completion: @escaping (_ error : Error?, _ blooks_data: [bookingHistory])->Void) {
        guard let email = helper.getEmail() else {
            completion ( nil , [] )
            return
        }
        
        let url = "http://192.168.8.105/atareeg/public/api/bookingHistory"
        let parameters = ["email" :  email]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseJSON { responce in
                switch responce.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    let json = JSON(value)
                    guard let dataArr = json["bookingHistory"].array else
                    {
                        
                        completion (nil, [] )
                        return
                    }
                    
                    var blooks_data = [bookingHistory]()
                    for data in dataArr {
                        guard let data = data.dictionary else {return}
                        
                        let blook_data = bookingHistory()
                      
                        blook_data.b_date = data["b_date"]?.string ?? ""
                        blook_data.bl_name = data["bl_name"]?.string ?? ""
                        blook_data.b_id_generator = data["b_id_generator"]?.int ?? 0
                        blook_data.b_name = data["b_name"]?.string ?? ""
                        blook_data.b_num_of_guests = data["b_num_of_guests"]?.int ?? 0
                        blook_data.b_payment_receipt = data["b_payment_receipt"]?.string ?? ""
                        blook_data.b_cost = data["b_cost"]?.int ?? 0
                        blook_data.b_payment_way = data["b_payment_way"]?.string ?? ""
                        blook_data.b_status = data["b_status"]?.string ?? ""
                        blooks_data.append(blook_data)
                        
                    }
                    completion(nil, blooks_data)
                    
                }
        }
    }
    class func checkNumOfGuests ( completion: @escaping (_ error : Error?, _ success: Bool)->Void) {
        guard let b_date = helper.getBookDate()
            
            else {
                completion ( nil , false )
                return
        }
        print(b_date)
        let url = "http://192.168.8.105/atareeg/public/api/checkGuestsNumber"
        let parameters = ["b_date" : b_date]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseString { responce in
                switch responce.result
                {
                case .failure(let error):
                    completion (error, false)
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    let ff = value as? String
                    if ff == "weekend" {
                    completion (nil, true)
                }else
                    {
                      completion (nil, false)
                    }
        }
    }
    }
    class func getAvailableTimeBlooks (completion: @escaping (_ error : Error?, _ blooks: [availableTimeBlooks])->Void) {
        guard let b_date = helper.getBookDate()
          
            else {
            completion ( nil , [] )
            return
        }
        print(b_date)
        
        let url = "http://192.168.8.105/atareeg/public/api/firstStepBooking"
        let parameters = ["b_date" :  b_date]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseJSON { responce in
                switch responce.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    let json = JSON(value)
                    guard let dataArr = json["availableTimeBlocks"].array else
                    {
                        
                        completion (nil, [] )
                        return
                    }
                    
                    var blooks = [availableTimeBlooks]()
                    for data in dataArr {
                        guard let data = data.dictionary else {return}
                        
                        let blook = availableTimeBlooks()
                        blook.bl_name = data["bl_name"]?.string ?? ""
                        blook.bl_started_at = data["bl_started_at"]?.string ?? ""
                        blook.bl_ended_at = data["bl_ended_at"]?.string ?? ""
                        blook.b_flag = data["b_flag"]?.string ?? ""
                        blook.bl_price = data["bl_price"]?.int ?? 0
                        blook.bl_id = data["bl_id"]?.int ?? 0
                        
                        blooks.append(blook)
                        
                    }
                    completion(nil, blooks)
                    
                }
        }
    }
    class func checkNumOfGuests_ios ( numOfGuests:String, completion: @escaping (_ error : Error?, _ success: Bool)->Void) {
        guard let b_date = helper.getBookDate()
            
            else {
                completion ( nil , false )
                return
        }
        print(b_date)
        let url = "http://192.168.8.105/atareeg/public/api/checkGuestsNumber_ios"
        let parameters = ["b_date" : b_date,
            "b_num_of_guests" : numOfGuests]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseString { responce in
                switch responce.result
                {
                case .failure(let error):
                    completion (error, false)
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    let ff = value as? String
                    if ff == "true" {
                        completion (nil, true)
                    }else
                    {
                        completion (nil, false)
                    }
                }
        }
    }
    class func terms (completion: @escaping (_ error : Error?, _ terms: [constraints])->Void) {
       
        
        let url = "http://192.168.8.105/atareeg/public/api/secondStepBooking"
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseJSON { responce in
                switch responce.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    let json = JSON(value)
                    guard let dataArr = json["constraints"].array else
                    {
                        
                        completion (nil, [] )
                        return
                    }
                    
                    var terms = [constraints]()
                    for data in dataArr {
                        guard let data = data.dictionary else {return}
                        
                        let term = constraints()
                        
                        term.c_constraint = data["c_constraint"]?.string ?? ""
                       
                        terms.append(term)
                        
                    }
                    completion(nil, terms)
                    
                }
        }
    }
    class func getLastBooking (completion: @escaping (_ error : Error?, _ blooks: [id])->Void) {
        guard let b_date = helper.getBookDate()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let email = helper.getEmail()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_payment_way = helper.getPaymentWay()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_num_of_guests = helper.getNumofGuests()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_belela = helper.getBleela()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_deafa = helper.getDyafa()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let block_id = helper.getBlockID()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_cost = helper.getCost()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_name = helper.getBookName()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_phone1 = helper.getPhone1()
            
            else {
                completion ( nil , [] )
                return
        }
        guard let b_phone2 = helper.getPhone2()
            
            else {
                completion ( nil , [] )
                return
        }
        print(b_date)
        print(email)
        print(b_payment_way)
        print(b_num_of_guests)
        print(b_belela)
        print(b_deafa)
        print(block_id)
        print(b_cost)
        print(b_name)
        print(b_phone1)
        print(b_phone2)
        
        let url = "http://192.168.8.105/atareeg/public/api/thirdStepBooking"
        let parameters = ["b_date" :  b_date,
                          "email" :  email,
                          "b_payment_way" :  b_payment_way,
                          "b_num_of_guests" :  b_num_of_guests,
                          "b_belela" :  b_belela,
                          "b_deafa" :  b_deafa,
                          "block_id" :  block_id,
                          "b_cost" :  b_cost,
                          "b_name" :  b_name,
                          "b_phone1" : b_phone1,
                          "b_phone2" :  b_phone2
            ] as [String : Any]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<900)
            .responseJSON { responce in
                switch responce.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case.success(let value):
                    
                    print(value)
                    let json = JSON(value)
                    guard let dataArr = json["id"].array else
                    {
                        
                        completion (nil, [] )
                        return
                    }
                    
                    var blooks = [id]()
                    for data in dataArr {
                        guard let data = data.dictionary else {return}
                        
                        let blook = id()
                        blook.b_id_generator = data["b_id_generator"]?.int ?? 0
                        blook.b_name = data["b_name"]?.string ?? ""
                        blook.b_date = data["b_date"]?.string ?? ""
                        blook.b_status = data["b_status"]?.string ?? ""
                        blook.b_num_of_guests = data["b_num_of_guests"]?.int ?? 0
                        blook.b_payment_way = data["b_payment_way"]?.string ?? ""
                        blook.b_deafa = data["b_deafa"]?.string ?? ""
                        blook.b_belela = data["b_belela"]?.string ?? ""
                        blook.b_cost = data["b_cost"]?.int ?? 0
                        blook.block_id = data["block_id"]?.int ?? 0
                        blook.b_phone1 = data["b_phone1"]?.string ?? ""
                        blook.b_phone2 = data["b_phone2"]?.string ?? ""
                        blook.name = data["name"]?.string ?? ""
                        blook.email = data["email"]?.string ?? ""
                      
                        
                        
                        blooks.append(blook)
                        
                    }
                    completion(nil, blooks)
                    
                }
        }
    }
}


