//
//  AddressTableViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 07/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import SwiftyJSON

class AddressTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }
    
    func jsonParsing()  {
        
        var paramsDictionary = [String:Any]()
        let url = URL(string: "http://devmouldies.alinasolution.com/shop/getAddress")
        paramsDictionary["username"] = "BBB"
        URLSession.shared.dataTask(with: url!, params:paramsDictionary) { (data, response, error) in
            guard let data = data else {return}
            do{
                let json = try JSON(data:data)
                print(json)
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
  

}
