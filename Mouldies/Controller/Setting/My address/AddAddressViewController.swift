//
//  AddAddressViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddAddressViewController: UIViewController {
    
    // MARK: DataModel
    
    let addAddressDataModel = MouldiesDataModel()
    
    
    // MARK: URL
    
    let AddAddress_URL = "http://test.mouldies.com/shop/addAddress"
    
    
    // MARK: View Controllers
    
    @IBOutlet var FirstNameTextField: UITextField!
    @IBOutlet var LastNameTextField: UITextField!
    @IBOutlet var MobileTextField: UITextField!
    @IBOutlet var CompanyTextField: UITextField!
    @IBOutlet var AddressOneTextField: UITextField!
    @IBOutlet var AddressTwoTextField: UITextField!
    @IBOutlet var CityTextField: UITextField!
    @IBOutlet var StateTextField: UITextField!
    @IBOutlet var CountryTextField: UITextField!
    @IBOutlet var PincodeTextField: UITextField!
    @IBOutlet var Message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Message.text = ""
    }
    
    // MARK: Save Data
    
    @IBAction func AddBtn(_ sender: Any) {
        
        let custidDM = "141"
        let firstnameDM = FirstNameTextField.text!
        let lastnameDM = LastNameTextField.text!
        let addressOneDM = AddressOneTextField.text!
        let addressTwoDM = AddressTwoTextField.text!
        let cityDM = CityTextField.text!
        let stateDM = StateTextField.text!
        let postDM = PincodeTextField.text!
        let countryDM = CountryTextField.text!
        let mobileDM = MobileTextField.text!
        let is_default_billingDM = "false"
        let is_default_shippingDM = "false"
        let companyDM = CompanyTextField.text!
        
        let parms : [String : String] = ["customer_id" : custidDM,
                                         "firstname" : firstnameDM,
                                         "lastname" : lastnameDM,
                                         "street1" : addressOneDM,
                                         "street2" : addressTwoDM,
                                         "city" : cityDM,
                                         "region" : stateDM,
                                         "postcode" : postDM,
                                         "country_id" : countryDM,
                                         "telephone" : mobileDM,
                                         "is_default_billing" : is_default_billingDM,
                                         "is_default_shipping" : is_default_shippingDM,
                                         "company" : companyDM]
        
        addAddressData(url: AddAddress_URL, parameters: parms)
    }
    
    func addAddressData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateData(json: RestaurantJSON)
                
                if self.addAddressDataModel.status == 1{
                    self.Message.text = self.addAddressDataModel.msg
                }
                else{
                    self.Message.text = self.addAddressDataModel.msg
                }
                
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateData(json : JSON)  {
        
        addAddressDataModel.msg = json["msg"].stringValue
        addAddressDataModel.status = json["status"].intValue
        
    }

}
