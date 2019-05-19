//
//  Setting.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 06/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class Setting: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var SettingTbl: UITableView!
    
    var SettingNameArray = ["My account","My address","My order","My Subscription","My Loyalty points","Legal","Change password ","Signout"]
    
    var SettingImageArray = ["Profile","Address","Order","Subscription","Loyalty","Legal","ChangePassword","Signout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = SettingTbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        
        cell.SettingImage.image = UIImage(named: (SettingImageArray[indexPath.row] + ".png"))
        cell.SettingName.text = SettingNameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail : SettingDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingDetails") as! SettingDetailsViewController
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }

}
