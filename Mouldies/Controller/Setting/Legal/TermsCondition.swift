//
//  TermsCondition.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 20/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import WebKit

class TermsCondition: UIViewController {
    
    @IBOutlet var TCWebVC: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let alert = UIAlertController(title: "Signout", message: "Signout Succfully.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Done", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil )
        
    }
      
}


