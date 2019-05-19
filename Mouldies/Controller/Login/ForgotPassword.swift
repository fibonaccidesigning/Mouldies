//
//  ForgotPassword.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 30/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ForgotPassword: UIViewController {
    
    //MARK: Data Model
    
    let forgotDataModel = MouldiesDataModel()
    
    //MARK: URL
    
    let ForgotPassword_URL = "http://test.mouldies.com//shop/forgotPassword"
    

    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var MessageLabel: UILabel!
    @IBOutlet var DoneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MessageLabel.text = ""
        self.HideKeybord()

    }
    
    
    //MARK: Submit Data
    
    @IBAction func Done(_ sender: Any) {
        
        let emailDM = EmailTextField.text!
        
        let parms : [String : String] = ["email" : emailDM]
        
        getRestaurantData(url: ForgotPassword_URL, parameters: parms)
        
    }
    
    func getRestaurantData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                
                print(self.forgotDataModel.status)
                
                if self.forgotDataModel.status == 1{
                    self.performSegue(withIdentifier: "GoToLogin", sender: self)
                }
                else{
                    self.MessageLabel.text = self.forgotDataModel.msg
                }
            }
            else{
                print("Error")
            }
        }
        
    }

    func updateRestaurantData(json : JSON)  {
        forgotDataModel.msg = json["msg"].stringValue
        forgotDataModel.status = json["status"].intValue
        
    }
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}


