//
//  MouldiesDataModel.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 30/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation
import UIKit

class MouldiesDataModel  {
    
    
    // MARK: Registration
    
    var status : Int!
    var msg : String!
    var email : String!
    var password : String!
    var confirmation : String!
    var firstname : String!
    var lastname : String!
    var mobile : Int!
    var country_id : String!
    var comapny_name : String!
    var logo : String!
    var pancard : String!
    var upoad_pancard : String!
    var gst_no : String!
    var gst_certificate : String!
    var business_certificate : String!
    var addhar_proof : String!
    
    
    // MARK: Home
    
    var seller_storename : String!
    var vendor_logo : String!
    
    var customer_id : Int!
    var name : String!
    var price : Float!
    var image_url : String!
    
    
    // MARK: Shared Master
    
    var cat_id : Int!
    var flag_home : Int!
    var subscription1_id : Int!
    var page : Int!
    var is_freelancer_product : Int!
    
    
    // MARK: Setting My Profile
    
    var country_code : String!
    var address_proof : String!
    
    
    // MARK: Address
    
    var street : String!
    var city : String!
    var country : String!
    var postcode : Int!
    var address_id : Int!
    var is_default_billing : Bool!
    var is_default_shipping : Bool!
    
    // MARK: Order
    
    var order_id : Int!
    var ship_to : String!
    var grand_total : Float!
    var updated_at : String!
    
    var amount_remaining : Int?
    var plan_title : String?
    var days_remaining : String?
    
    
    var loyalty_point : String?
    
}
