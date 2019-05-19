//
//  Legal.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation
import UIKit

class Legal : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: In ViewDidLoad()
        
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("This Select: \(indexPath.section)")
    }
}


