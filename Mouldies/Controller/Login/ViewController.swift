//
//  ViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 30/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    
    // MARK: DataModel
    
    let loginDataModel = MouldiesDataModel()
    
    
    // MARK: URL
    
    let Login_URL = "http://test.mouldies.com/shop/userLogin"
    
    
    @IBOutlet var UsernameTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    @IBOutlet var LoginBtn: UIButton!
    @IBOutlet var ForgotPasswordBtn: UIButton!
    @IBOutlet var CantAccountBtn: UIButton!
    @IBOutlet var MessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       MessageLabel.text = ""
        
        self.HideKeybord()
    }
    

    // MARK: Login
    
    @IBAction func Login(_ sender: Any) {
        let emailDM = UsernameTextField.text!
        let passwordDM = PasswordTextField.text!
       
        
        let parms : [String : String] = ["email" : emailDM,
                                         "password" : passwordDM]
        
        getRestaurantData(url: Login_URL, parameters: parms)
    }
    
    func getRestaurantData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                
                print(self.loginDataModel.status)
                
                if self.loginDataModel.status == 1{
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
                else{
                    self.MessageLabel.text = self.loginDataModel.msg
                }
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateRestaurantData(json : JSON)  {
        
        loginDataModel.msg = json["msg"].stringValue
        loginDataModel.status = json["status"].intValue
        
    }
    
    
    //MARK: Forget Password
    
    @IBAction func ForgetPassword(_ sender: Any) {
        performSegue(withIdentifier: "GoToForgotPassword", sender: self)
    }
    
    //MARK: Register
    
    @IBAction func CantAccount(_ sender: Any) {
        performSegue(withIdentifier: "GoToRegister", sender: self)
    }
    
}
