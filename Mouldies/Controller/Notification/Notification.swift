//
//  Notification.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 15/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Notification: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: DataModel
    
    let homeDataModel = MouldiesDataModel()
    
    var selectedProduct : SharedDataModel?
    var selectedSeller : SellerDataModel?
    
    
    //MARK: Variable
    
    var NotificationDataDictionary : [SharedDataModel] = []
    
    
    //MARK: URL
    
    let Notification_URL = "http://test.mouldies.com/shop/GetNotificationList"
    
    
    //MARK: ViewControllers
    
    @IBOutlet var NotificationTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let custID = "99"
        
        let parms : [String : String] = ["customer_id" : custID ]
        
        getNotificationData(url: Notification_URL, parameters: parms)

    }
    
    func getNotificationData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateNotificationData(json: CustomerJSON)
                
                print(respondse)
            }
            else{
                print("Json Error")
                print(Error.self)
            }
        }

    }
    
    func updateNotificationData(json : JSON)  {
        
        let pro = json["notificaiton"].array
        let range = pro!.count
        
        for i in 0..<range{
            
            NotificationDataDictionary.append(SharedDataModel(json: (pro![i].dictionaryObject)!))
            
            self.NotificationTable.reloadData()
        
        
        }


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotificationDataDictionary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
        
        let urlD = NotificationDataDictionary[indexPath.item].thumbnail
        
        if let url = URL(string: urlD!){
            do{
                let data = try Data(contentsOf: url)
                cell.NotificationImage.image = UIImage(data: data)
            }
            catch
            {
                print("Error")
            }
        }
        
        
        cell.NotificationTitle.text = NotificationDataDictionary[indexPath.item].title
        cell.NotificationMsg.text = NotificationDataDictionary[indexPath.item].message
    
        
        
        return cell
    }
    

}
