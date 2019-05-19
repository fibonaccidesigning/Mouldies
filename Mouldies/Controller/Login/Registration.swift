//
//  Registration.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 30/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Registration: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: DataModel
    
    let registerDataModel = MouldiesDataModel()
    
    
    // MARK: URL
    
    let Register_URL = "http://test.mouldies.com/shop/UserRegistration"
    let country_URL = "http://test.mouldies.com/shop/getCountry"

    
    // MARK: Variable
    
    var pickData : [Dictionary<String, String>] = []
    var selectedItem = ""
    
    
    // MARK: ViewController
    
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    @IBOutlet var ConfirmPasswordTextField: UITextField!
    @IBOutlet var FirstnameTextField: UITextField!
    @IBOutlet var LastnameTextField: UITextField!
    @IBOutlet var MobileTextField: UITextField!
    @IBOutlet var CountrynameTextField: UITextField!
    @IBOutlet var LogoUploadBtn: UIButton!
    @IBOutlet var PancardTextField: UITextField!
    @IBOutlet var PancardUploadBtn: UIButton!
    @IBOutlet var GSTnoTextField: UITextField!
    @IBOutlet var GSTCertificateBtn: UIButton!
    @IBOutlet var BusinessCirtificateBtn: UIButton!
    @IBOutlet var AddharProofBtn: UIButton!
    @IBOutlet var MessageLabel: UILabel!
    @IBOutlet var RegisterBtn: UIButton!
    
    @IBOutlet var CountryPicker: UIPickerView!
    @IBOutlet var CounterView: UIView!
    @IBOutlet var BarView: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MessageLabel.text = ""
        
        CountryPicker.isHidden = true
        BarView.isHidden = true
        CounterView.isHidden = true
        self.HideKeybord()
        
    }
    
    //MARK: Register

    @IBAction func Register(_ sender: Any) {
        
        let emailDM = EmailTextField.text!
        let passwordDM = PasswordTextField.text!
        let confirmationDM = ConfirmPasswordTextField.text!
        let firstnameDM = FirstnameTextField.text!
        let lastnameDM = LastnameTextField.text!
        let mobileDM = MobileTextField.text!
        let country_idDM = ""
        let comapny_nameDM = CountrynameTextField.text!
        let logoDM = ""
        let pancardDM = PancardTextField.text!
        let upoad_pancardDM = ""
        let gst_noDM = GSTnoTextField.text!
        let gst_certificateDM = ""
        let business_certificateDM = ""
        let addhar_proofDM = ""
        
        let parms : [String : String] = ["email" : emailDM,
                                         "password" : passwordDM,
                                         "confirmation" : confirmationDM,
                                         "firstname" : firstnameDM,
                                         "lastname" : lastnameDM,
                                         "mobile" : mobileDM,
                                         "country_id" : country_idDM,
                                         "comapny_name" : comapny_nameDM,
                                         "logo" : logoDM,
                                         "pancard" : pancardDM,
                                         "upoad_pancard" : upoad_pancardDM,
                                         "gst_no" : gst_noDM,
                                         "gst_certificate" : gst_certificateDM,
                                         "business_certificate" : business_certificateDM,
                                         "addhar_proof" : addhar_proofDM]
        
        getData(url: Register_URL, parameters: parms)
        
    }
    
    func getData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRegisterData(json: RestaurantJSON)
                
                print(self.registerDataModel.status)
                
                if self.registerDataModel.status == 1{
                    self.performSegue(withIdentifier: "GoToLogin", sender: self)
                }
                else{
                    self.MessageLabel.text = self.registerDataModel.msg
                }
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateRegisterData(json : JSON)  {
        
                registerDataModel.msg = json["msg"].stringValue
                registerDataModel.status = json["status"].intValue
        
            }
    
    
    // MARK: Country PickerView
  
    @IBAction func CountryBtn(_ sender: Any) {
        getPickData(url: country_URL)
        
        CountryPicker.isHidden = false
        BarView.isHidden = false
        CounterView.isHidden = false
    }
    
    func getPickData(url : String) {
        
        Alamofire.request(url, method: .get).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateCountrytData(json: RestaurantJSON)
                
            }
            else{
                
                print("Error")
                
            }
        }
    }
    
    func updateCountrytData(json : JSON)  {
        
        let countryyy = json["country"].array
        
        let range = countryyy!.count
        
        for i in 0..<range{
            
            pickData.append(countryyy![i].dictionaryObject as! [String : String])
            
          //  print("\(i + 1): \(pickData[i]["country_id"] as Any)")
            
            selectedItem = pickData[i]["country_id"]!
            
            self.CountryPicker.reloadAllComponents()
        }
        
    }
    
    //MARK: PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickData[row]["country_id"]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem = pickData[row]["country_id"]!
        CountrynameTextField.text = selectedItem
        self.CountryPicker.reloadAllComponents()
    }
    
    //MARK: Done Button
    
    @IBAction func Done(_ sender: Any) {
        CountryPicker.isHidden = true
        BarView.isHidden = true
        CounterView.isHidden = true
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}






