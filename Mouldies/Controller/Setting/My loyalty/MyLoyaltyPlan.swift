//
//  MyLoyaltyPlan.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyLoyaltyPlan: UIViewController {

    
    // MARK: DataModel
    
    var loyalDataModel = MouldiesDataModel()
   
    var selectedLoyalty : LoyaltyDataModel?
    var LoyaltyDataDictionary : [LoyaltyDataModel] = []
    
    
    // MARK: URL
    
    let GetLoylati_URL = "http://test.mouldies.com/shop/GetLoyalty"
    
    @IBOutlet var LoylatyPointsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let custid = "99" //selectedProduct?.customer_id
        let parms : [String : String] = ["customer_id" : custid]
        getGetLoyaltyData(url: GetLoylati_URL, parameters: parms)


    }
    
    func getGetLoyaltyData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateLoyalityData(json: CustomerJSON)
                
                self.LoylatyPointsLbl.text = self.loyalDataModel.loyalty_point
            }
            else{
                print("Error")
            }
        }
        
    }
    func updateLoyalityData(json : JSON)  {
        
        loyalDataModel.loyalty_point = json["loyalty_point"].stringValue
   
    }
    
}
