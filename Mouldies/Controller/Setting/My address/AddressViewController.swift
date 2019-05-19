//
//  AddressViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 07/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // MARK: DataModel
    
    let addressDataModel = MouldiesDataModel()
    
    var selectedProduct : SharedDataModel?

    var SharedDataDictionary : [SharedDataModel] = []

    
    // MARK: URL
    
    let Address_URL = "http://test.mouldies.com/shop/getAddress"
    let Delete_URL = ""
    
    
    // MARK: Variable

    var address = [String]()
    var selectedItem = ""
    var SettingNameArray = ["a","b"]
    var AddressDataDiceionary : [Dictionary<String, String>] = []
    var sss : [Dictionary<String, String>] = []
    
    @IBOutlet var AddressTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddressTbl.tableFooterView = UIView()
        
        let custid = "99" //selectedProduct?.customer_id
        var parms : [String : String] = ["customer_id" : custid]
        getAddressData(url: Address_URL, parameters: parms)

    }
    
    func getAddressData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateAddressData(json: RestaurantJSON)
                
               // print(respondse)
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updateAddressData(json : JSON)  {
        
        addressDataModel.msg = json["msg"].stringValue
        addressDataModel.status = json["status"].intValue
        
        addressDataModel.firstname = json["address"]["firstname"].stringValue
        addressDataModel.lastname = json["address"]["lastname"].stringValue
        addressDataModel.street = json["address"]["street"].stringValue
        addressDataModel.city = json["address"]["city"].stringValue
        addressDataModel.country = json["address"]["country"].stringValue
        addressDataModel.postcode = json["address"]["postcode"].intValue
        addressDataModel.mobile = json["address"]["mobile"].intValue
        
        let pro = json["address"].array
        let range = pro!.count
        
        for i in 0..<range{
    
         //   print(json["address"][i].dictionary as Any)
            print(json["address"][i]["street"] as Any)
           
            address = json["address"][i]["street"].arrayObject as! [String]
            print(address)
            self.AddressTbl.reloadData()
            
        }
        
        print(addressDataModel.street)
        
    }
    
    
    // MARK: Tabel Data
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = AddressTbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddressTableViewCell
    
        cell.FullNameLbl.text = address[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "AddressDetail") as! AddressDetailTableViewController
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    
    // MARK: Delete Record
    
    func DeleteRecord()  {
        
        
        
        let addressID = "99" //selectedProduct?.address_id
        let parms : [String : String] = ["address_id" : addressID]
        deleteAddressData(url: Address_URL, parameters: parms)
        
    }
    
    
    func deleteAddressData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateDeleteRecord(json: RestaurantJSON)
                print(self.addressDataModel.msg)
            }
            else{
                print("Error")
            }
        }
        
    }
    func updateDeleteRecord(json : JSON)  {
        
        addressDataModel.msg = json["msg"].stringValue
        addressDataModel.status = json["status"].intValue
    
    }


}
