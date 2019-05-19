//
//  MySubscriptionsPlan.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MySubscriptionsPlan: UIViewController {

    // MARK: DataModel
    
    let subDataModel = MouldiesDataModel()
    var selectedProduct : SubscriptionsDataModel?

   
    var SubscriptionDataDictionary : [SubscriptionsDataModel] = []
    
    
    // MARK: URL
    
    let GetMyPlan_URL = "http://test.mouldies.com/shop/getMyplan"
    
    
    
    @IBOutlet var PlanTypeLbl: UILabel!
    @IBOutlet var LeftDaysLbl: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let custid = "99" //selectedProduct?.customer_id
        
        let parms : [String : String] = ["customer_id" : custid]
        
        getSubscriptionPlanoData(url: GetMyPlan_URL, parameters: parms)
        
    }
    
    func getSubscriptionPlanoData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateSubscriptionPlanoData(json: CustomerJSON)
                
            
                self.LeftDaysLbl.text = ("Days Remaing: \(self.subDataModel.days_remaining!)")
                self.PlanTypeLbl.text = self.subDataModel.plan_title
                
            }
            else{
                print("Error")
            }
        }
        
    }

    func updateSubscriptionPlanoData(json : JSON)  {
        
        subDataModel.days_remaining = json["plan_data"]["days_remaining"].stringValue
        subDataModel.plan_title = json["plan_data"]["plan_title"].stringValue
 
    }
    
    @IBAction func UpdateBtn(_ sender: Any) {

    }
    
    @IBAction func RenewBtn(_ sender: Any) {
        
    }
    
}
