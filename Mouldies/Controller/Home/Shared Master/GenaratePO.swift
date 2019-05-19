//
//  GenaratePO.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 11/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation
import UIKit

class GenaratePO: UITableViewController {
    
    //MARK: DataModel
    
    var selectedProduct: SharedDataModel?
    
    
    //MARK: Variable
    
    var RadioResponse = 0
    
    //MARK: ViewControllers
    
    @IBOutlet var FinishTileSizeLbl: UILabel!
    @IBOutlet var DieSizeLbl: UILabel!
    @IBOutlet var DesignDepthLbl: UILabel!
    @IBOutlet var FinishLbl: UILabel!
    @IBOutlet var RubberPunchLbl: UILabel!
    @IBOutlet var QuantityTextField: UITextField!
    @IBOutlet var VMCApplicableLbl: UILabel!
    @IBOutlet var TotalRubberPunchPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FinishTileSizeLbl.text = selectedProduct?.finish_tile_size
        DieSizeLbl.text = selectedProduct?.finish_tile_size
        DesignDepthLbl.text = selectedProduct?.design_depth
        FinishLbl.text = selectedProduct?.design_type_finish
        RubberPunchLbl.text = selectedProduct?.price
        VMCApplicableLbl.text = selectedProduct?.vmc_applicable
    
 
    }
    
    
    @IBAction func QuantityCalcute(_ sender: Any) {
        
        
        let Qut = QuantityTextField.text
        
        
        let sHeight = 10
        let sWeight = 20
        var srubber = 0
        var sRubberPrice = 0
        var sTotalRubber = 0
        
        let vHeight = 10
        let vWeight = 20
        var VMCPrice = 100
        var VMCQT = 0
        var GVSTotal = 0
        
//        sHeight = Int(((selectedProduct?.price)!))!
//        sWeight = Int(((selectedProduct?.price)!))!
//        rubber = Int(((selectedProduct?.price)!))!
//
        if selectedProduct?.vmc_applicable == "No"{
            
            VMCPrice =  (vHeight * vWeight) / 100
            VMCQT = Int(VMCPrice) * Int(Qut!)! * Int(RadioResponse)
           
            sRubberPrice = (sWeight * sHeight ) / 100
            sTotalRubber = Int(sRubberPrice) * Int(Qut!)! * Int(RadioResponse)
            
            GVSTotal = VMCPrice + sTotalRubber
           
            TotalRubberPunchPrice.text = ("\(GVSTotal)")
            
        }else{
            
            sRubberPrice = (sWeight * sHeight ) / 100
            sTotalRubber = Int(sRubberPrice) * Int(Qut!)! * Int(RadioResponse)
            
            TotalRubberPunchPrice.text = ("\(sTotalRubber)")
            
        }
        
    }
    
    
    @IBAction func AddToCart(_ sender: Any) {
        
        
        

            let alert = UIAlertController(title: "🛒", message: "Succefully Added in Cart", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Done", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil )
        
      
      
    }
    
}


