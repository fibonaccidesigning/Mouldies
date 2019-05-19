//
//  SubscriptionsDataModel.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 20/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation

class SubscriptionsDataModel {
    
    
    var planTitle =  "plan_title"
    var custEmail =  "customer_email"
    var amountRemaing =  "amount_remaining"
    var subscriptionStart =  "subscription_start_time"
    var subscriptionEnd = "subscription_end_time"
    var daysRemaing = "days_remaining"
    var loylatyPoint = "loyalty_point"
    var planID = "plan_id"
    
    var plan_title : String?
    var plan_id : Int?
    var customer_email : String?
    var amount_remaining : Int?
    var subscription_start_time : String?
    var subscription_end_time : String?
    var days_remaining : String?
    
    
    
    init(json: [String : Any?]) {
        
        if let cid = json[planTitle] as? String{
            self.plan_title = cid
        }
        if let cid = json[custEmail] as? String{
            self.customer_email = cid
        }
        if let cid = json[amountRemaing] as? Int{
            self.amount_remaining = cid
        }
        if let cid = json[subscriptionStart] as? String{
            self.subscription_start_time = cid
        }
        if let cid = json[subscriptionEnd] as? String{
            self.subscription_end_time = cid
        }
        if let cid = json[daysRemaing] as? String{
            self.days_remaining = cid
        }
        if let cid = json[loylatyPoint] as? String{
            self.loylatyPoint = cid
        }
        
        if let pid = json[planID] as? Int {
            self.plan_id = pid
        }
    }
    
}
