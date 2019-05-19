//
//  Order.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Order: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: DataModel
    
    let myOrderDataModel = MouldiesDataModel()
    var selectedProduct : SharedDataModel?
    var SharedDataDictionary : [SharedDataModel] = []

    
    // MARK: URL
    
    let OrderHistry_URL = "http://test.mouldies.com/shop/OrderHistory"
    
    
    // MARK: Variable
    
    var order = [String]()
    var shipTo = [String]()
    var date = [String]()
    var total = [String]()
    
    var selectedItem = ""
    
    var SettingNameArray = ["a","b"]
    
    var AddressDataDiceionary : [Dictionary<String, String>] = []
    var sss : [Dictionary<String, String>] = []
    

    @IBOutlet var OrderTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrderTbl.tableFooterView = UIView()
        
        let custid = "99" //selectedProduct?.customer_id
        
        let parms : [String : String] = ["customer_id" : custid]
        
        getOrderHistoryData(url: OrderHistry_URL, parameters: parms)
        
    }
    
    func getOrderHistoryData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateOrderData(json: CustomerJSON)
                
                print(respondse)
            }
            else{
                print("Json Error")
                print(Error.self)
            }
        }
        
    }
    
    func updateOrderData(json : JSON)  {
        
        let pro = json["order_data"].array
        let range = pro!.count
        
        for i in 0..<range{
            
            SharedDataDictionary.append(SharedDataModel(json: (pro![i].dictionaryObject)!))
            
            self.OrderTbl.reloadData()
            
        }

    }
    
    //MARK: TableView   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SharedDataDictionary.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = OrderTbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell
        
        cell.OrderNumberLbl.text = SharedDataDictionary[indexPath.item].order_id
        cell.ShipNameLbl.text = SharedDataDictionary[indexPath.item].ship_to
        cell.TotalLbl.text = SharedDataDictionary[indexPath.item].grand_total
        cell.DateLbl.text = SharedDataDictionary[indexPath.item].updated_at
        
        return cell
    }
    
  
}
