//
//  SettingDetailsViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 06/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SettingDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: DataModel
    
    let settingDetailDataModel = MouldiesDataModel()
    var SharedDataDictionary : [SharedDataModel] = []
    
    // MARK: Variables
    
    var pickData : [Dictionary<String, String>] = []
    var selectedItem  = ""
    
    
    
    // MARK: URL
    
    let GetUser_URL = "http://test.mouldies.com/shop/getUser"
    let UpdateUser_URL = "http://test.mouldies.com/shop/updateUser"
    let country_URL = "http://test.mouldies.com/shop/getCountry"
    
    
    // MARK: ViewController
    
    @IBOutlet var FirstNameTextField: UITextField!
    @IBOutlet var LastNameTextField: UITextField!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var MobileTextField: UITextField!
    @IBOutlet var CompanyTextField: UITextField!
    @IBOutlet var CountryTextField: UITextField!
    @IBOutlet var PanCardTextField: UITextField!
    @IBOutlet var GSTTextField: UITextField!
    
    @IBOutlet var PanCardImage: UIImageView!
    @IBOutlet var GSTImage: UIImageView!
    @IBOutlet var AddressImage: UIImageView!
    @IBOutlet var BusinessCirtiImage: UIImageView!
    @IBOutlet var Message: UILabel!
    
    @IBOutlet var CountryPicker: UIPickerView!
    @IBOutlet var DoneBtn: UIBarButtonItem!
    @IBOutlet var BarView: UIToolbar!
    @IBOutlet var ConterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Message.text = ""
        self.loadData()
        
        self.HideKeybord()
        CountryPicker.isHidden = true
        BarView.isHidden = true
        ConterView.isHidden = true

    }
    
    // MARK: Load Data In TextBox
    
    func loadData(){
        let custid = "99" //selectedProduct?.customer_id
        let parms : [String : String] = ["customer_id" : custid]
        getUserData(url: GetUser_URL, parameters: parms)
    }
    
    func getUserData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateGetUserData(json: CustomerJSON)
                
            }
            else{
                print("Error")
            }
        }
    }
    
    func updateGetUserData(json : JSON)  {
        
        settingDetailDataModel.firstname = json["firstname"].stringValue
        settingDetailDataModel.lastname = json["lastname"].stringValue
        settingDetailDataModel.email = json["email"].stringValue
        settingDetailDataModel.mobile = json["mobile"].intValue
        settingDetailDataModel.comapny_name = json["comapny_name"].stringValue
        settingDetailDataModel.country_code = json["country_code"].stringValue
        settingDetailDataModel.pancard = json["pancard"].stringValue
        settingDetailDataModel.gst_no = json["gst_no"].stringValue
        settingDetailDataModel.pancard = json["pancard"].stringValue
        
        settingDetailDataModel.gst_certificate = json["gst_certificate"].stringValue
        settingDetailDataModel.upoad_pancard = json["upoad_pancard"].stringValue
        settingDetailDataModel.address_proof = json["address_proof"].stringValue
        settingDetailDataModel.business_certificate = json["business_certificate"].stringValue
       
        FirstNameTextField.text = settingDetailDataModel.firstname
        LastNameTextField.text = settingDetailDataModel.lastname
        EmailTextField.text = settingDetailDataModel.email
        MobileTextField.text = String(settingDetailDataModel.mobile)
        CompanyTextField.text = settingDetailDataModel.comapny_name
        CountryTextField.text = settingDetailDataModel.country_code
        PanCardTextField.text = settingDetailDataModel.pancard
        GSTTextField.text = settingDetailDataModel.gst_no
        
        let GSTImg = settingDetailDataModel.gst_certificate
        let PanImg = settingDetailDataModel.upoad_pancard
        let AddressImg = settingDetailDataModel.address_proof
        let BusinessImg = settingDetailDataModel.business_certificate
        
        if let gsturl = URL(string: GSTImg!){
            do{
                let gstdata = try Data(contentsOf: gsturl)
                GSTImage.image = UIImage(data: gstdata)
            }
            catch
            {
                print("Image Error")
            }
        }
        if let panurl = URL(string: PanImg!){
            do{
                let pandata = try Data(contentsOf: panurl)
                PanCardImage.image = UIImage(data: pandata)
            }
            catch
            {
                print("Image Error")
            }
        }
        if let addurl = URL(string: AddressImg!){
            do{
                let adddata = try Data(contentsOf: addurl)
                AddressImage.image = UIImage(data: adddata)
            }
            catch
            {
                print("Image Error")
            }
        }
        if let busurl = URL(string: BusinessImg!){
            do{
                let busdata = try Data(contentsOf: busurl)
                BusinessCirtiImage.image = UIImage(data: busdata)
            }
            catch
            {
                print("Image Error")
            }
        }
   
    }
    
    // MARK: Save Data

    @IBAction func Save(_ sender: Any) {
        
        let custIDDM = "100"
        let emailDM = EmailTextField.text!
        let firstnameDM = FirstNameTextField.text!
        let lastnameDM = LastNameTextField.text!
        let mobileDM = MobileTextField.text!
        let comapny_nameDM = CountryTextField.text!
        let pancardDM = PanCardTextField.text!
        let gst_noDM = GSTTextField.text!
        
        let upoad_pancardDM = ""
        let addhar_proofDM = ""
        let gst_certificateDM = ""
        let business_certificateDM = ""
        
        
        let parms : [String : String] = ["customer_id" : custIDDM,
                                         "email" : emailDM,
                                         "firstname" : firstnameDM,
                                         "lastname" : lastnameDM,
                                         "landline" : mobileDM,
                                         "comapny_name" : comapny_nameDM,
                                         "pancard" : pancardDM,
                                         "upoad_pancard" : upoad_pancardDM,
                                         "addhar_proof" : addhar_proofDM,
                                         "gst_no" : gst_noDM,
                                         "gst_certificate" : gst_certificateDM,
                                         "business_certificate" : business_certificateDM]
        
        userUpdateData(url: UpdateUser_URL, parameters: parms)
        
    }
    
    func userUpdateData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateData(json: RestaurantJSON)
                
                print(self.settingDetailDataModel.status)
                
                if self.settingDetailDataModel.status == 1{
                  //  self.performSegue(withIdentifier: "GoToLogin", sender: self)
                    self.Message.text = self.settingDetailDataModel.msg
                }
                else{
                    self.Message.text = self.settingDetailDataModel.msg
                }
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateData(json : JSON)  {
        
        settingDetailDataModel.msg = json["msg"].stringValue
        settingDetailDataModel.status = json["status"].intValue
        
    }
    
    
    
    // MARK: Country PickerView
  
    
    @IBAction func CountryPickBtn(_ sender: Any) {
        
        getPickData(url: country_URL)
        
        CountryPicker.isHidden = false
        BarView.isHidden = false
        ConterView.isHidden = false
        
    }
    
    func getPickData(url : String) {
        
        Alamofire.request(url, method: .get).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                
            }
            else{
                
                print("Error")
                
            }
        }
    }
    
    func updateRestaurantData(json : JSON)  {
        
        let countryyy = json["country"].array
        
        let range = countryyy!.count
        
        for i in 0..<range{
            
            pickData.append(countryyy![i].dictionaryObject as! [String : String])
            
            print("\(i + 1): \(pickData[i]["country_id"] as Any)")
            
            selectedItem = pickData[i]["country_id"]!
            
            self.CountryPicker.reloadAllComponents()
        }
        
    }
    
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
        CountryTextField.text = selectedItem
    }
    
    @IBAction func Done(_ sender: Any) {
        CountryPicker.isHidden = true
        BarView.isHidden = true
        ConterView.isHidden = true
    }
    
    
    // MARK: Image Upload
    
//    func imgUpload()  {
//
//        let image = UIImage.init(named: "myImage")
//        let imgData = UIImageJPEGRepresentation(image!, 0.2)!
//
//        let parameters = ["name": rname] //Optional for extra parameter
//
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            } //Optional for extra parameters
//        },
//                         to:"mysite/upload.php")
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response.result.value)
//                }
//
//            case .failure(let encodingError):
//                print(encodingError)
//            }
//        }
//    }
    
}

extension UIViewController{
    
    func HideKeybord() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
}


