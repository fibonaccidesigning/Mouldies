//
//  LoyaltyDataModel.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 20/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation

class LoyaltyDataModel {
    
    
    var LoyaltyPt = "loyalty_point"
    
    var loyalty_point : Int?
    
    init(json: [String: Any?]) {
        
        if let lp = json[LoyaltyPt] as? Int{
            self.loyalty_point = lp
        }
        
    }
    
}
