//
//  ChangePassword.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ChangePassword: UIViewController {
    
    
    // MARK: DataModel
    
    let ChangePasswordDataModel = MouldiesDataModel()
    
    
    // MARK: URL
    
    let ChangePassword_URL = "http://test.mouldies.com/shop/ChangePassword"
 
    
    @IBOutlet var OldPasswordTextField: UITextField!
    @IBOutlet var NewPasswordTextField: UITextField!
    @IBOutlet var ConfirmPasswordTextField: UITextField!
    @IBOutlet var Message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         Message.text = ""
        
    }
    
    
    // MARK: Submit Data

    @IBAction func Submit(_ sender: Any) {
        
        let store_idDM = "1"
        let customer_idDM = OldPasswordTextField.text!
        let old_passwordDM = NewPasswordTextField.text!
        let new_passwordDM = ConfirmPasswordTextField.text!
        
        let parms : [String : String] = ["store_id" : store_idDM,
                                         "customer_id" : customer_idDM,
                                         "old_password" : old_passwordDM,
                                         "new_password" : new_passwordDM]
                                         
        
        submitData(url: ChangePassword_URL, parameters: parms)
        
    }
    
    func submitData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateChangePasswordData(json: RestaurantJSON)
                
                print(self.ChangePasswordDataModel.status)
                
                if self.ChangePasswordDataModel.status == 1{
                    self.Message.text = self.ChangePasswordDataModel.msg
                }
                else{
                    self.Message.text = self.ChangePasswordDataModel.msg
                }
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateChangePasswordData(json : JSON)  {
        
        ChangePasswordDataModel.msg = json["msg"].stringValue
        ChangePasswordDataModel.status = json["status"].intValue
        
    }
    
}
