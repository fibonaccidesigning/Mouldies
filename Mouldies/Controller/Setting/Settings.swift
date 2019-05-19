//
//  Setting.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 06/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class Setting: UITableViewController {

    @IBOutlet var SettingTableView: UITableView!
    
    var SettingNameArray = ["My account","My address","My order","My Subscription","My Loyalty points","Legal","Change password ","Signout"]
    
    let SettingImageArray : [UIImage] = [
        
        UIImage(named: "Profile")!,
        UIImage(named: "Address")!,
        UIImage(named: "Order")!,
        UIImage(named: "Subscription")!,
        UIImage(named: "Loyalty")!,
        UIImage(named: "Legal")!,
        UIImage(named: "ChangePassword")!,
        UIImage(named: "Signout")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingNameArray.count
    }

  

}
