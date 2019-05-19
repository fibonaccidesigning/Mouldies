//
//  SellerDataModel.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 12/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation

class SellerDataModel {
    
    var SellerId = "seller_id"
    var SellerName = "seller_name"
    var SellerDesc = "seller_description"
    var SellerStoreName = "seller_storename"
    var ContactNumber = "contact_number"
    var ContactMail = "contact_email"
    var Vandor_Logo = "vendor_logo"
    var CustomerID = "customer_id"
    
    var seller_id : String?
    var seller_name : String?
    var seller_description : String?
    var seller_storename : String?
    var contact_number : String?
    var contact_email : String?
    var vendor_logo : String?
    var customer_id : String?
    

    init(json: [String : Any?]){
        
        if let id = json[SellerId] as? String {
            self.seller_id = id
        }
        
        if let name = json[SellerName] as? String {
            self.seller_name = name
        }
        
        if let desc = json[SellerDesc] as? String {
            self.seller_description = desc
        }
        
        if let store = json[SellerStoreName] as? String {
            self.seller_storename = store
        }
        
        if let number = json[ContactNumber] as? String {
            self.contact_number = number
        }
        
        if let email = json[ContactMail] as? String {
            self.contact_email = email
        }
        
        if let V_logo = json[Vandor_Logo] as? String {
            self.vendor_logo = V_logo
        }
        
        if let cid = json[CustomerID] as? String {
            self.customer_id = cid
        }
        
    }

}

