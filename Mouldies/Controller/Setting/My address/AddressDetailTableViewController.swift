//
//  AddressDetailTableViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 07/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddressDetailTableViewController: UITableViewController {

    // MARK: DataModel
    
    let addressDetailDataModel = MouldiesDataModel()
    
    
    // MARK: URL
    
    let UpdateUser_URL = "http://test.mouldies.com/shop/editAddress"

    
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
      
    }
    
    // MARK: Save Data
    
    @IBAction func Save(_ sender: Any) {
        
        let custidDM = "99"
        let firstnameDM = FirstNameTextField.text!
        let lastnameDM = LastNameTextField.text!
        let addressOneDM = AddressOneTextField.text!
        let addressTwoDM = AddressTwoTextField.text!
        let cityDM = CityTextField.text!
        let stateDM = StateTextField.text!
        let postDM = PincodeTextField.text!
        let countryDM = CountryTextField.text!
        let mobileDM = MobileTextField.text!
        let addressidDM = "21"
        
        let parms : [String : String] = ["customer_id" : custidDM,
                                         "firstname" : firstnameDM,
                                         "lastname" : lastnameDM,
                                         "street1" : addressOneDM,
                                         "street2" : addressTwoDM,
                                         "city" : cityDM,
                                         "region" : stateDM,
                                         "pancard" : postDM,
                                         "country_id" : countryDM,
                                         "telephone" : mobileDM,
                                         "address_id" : addressidDM]
        
        updateAddressData(url: UpdateUser_URL, parameters: parms)
        
    }

    func updateAddressData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateData(json: RestaurantJSON)
                
                if self.addressDetailDataModel.status == 1{
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
                else{
                    self.Message.text = self.addressDetailDataModel.msg
                }
                
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateData(json : JSON)  {
        
        addressDetailDataModel.msg = json["msg"].stringValue
        addressDetailDataModel.status = json["status"].intValue
        
    }
    
        // MARK: Load Data In TextBox
    
}
