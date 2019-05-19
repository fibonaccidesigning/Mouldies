//
//  SharedMasterRubber.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 11/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SharedMasterRubber: UITableViewController {
    
    
    //MARK: DataModel
    
    let restaurantDataModel = MouldiesDataModel()
    var selectedProductt: SharedDataModel?
    var selecrSeller : SellerDataModel?
    
    var SharedDataDictionary : [SharedDataModel] = []
    
    var radioResponse : String?
    
    
    //MARK: URL
    
     let Product_URL = "http://test.mouldies.com/shop/GetProductDetail"
    
    @IBOutlet var ImageVC: UIImageView!
    @IBOutlet var ProductNameLbl: UILabel!
    @IBOutlet var RubberPunchLbl: UILabel!
    @IBOutlet var RcRubberPunchLbl: UILabel!
    @IBOutlet var ReRubberPunchLbl: UILabel!
    @IBOutlet var FinalTileSizeLbl: UILabel!
    @IBOutlet var DesignDepthLbl: UILabel!
    @IBOutlet var FinishLbl: UILabel!
    @IBOutlet var DieSizeLbl: UILabel!
    @IBOutlet var RemarksTextField: UITextField!
    @IBOutlet var RubberRadio: UIButton!
    @IBOutlet var RCRubberRadio: UIButton!
    @IBOutlet var RERUbberRadio: UIButton!
    
    
    //MARK: ViewControllers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlD = selectedProductt?.image_url

        if let url = URL(string: urlD!){
            do{
                let data = try Data(contentsOf: url)
                ImageVC.image = UIImage(data: data)
            }
            catch
            {
                print("Error")
            }
        }
        
        ProductNameLbl.text = selectedProductt?.name
        FinalTileSizeLbl.text = selectedProductt?.finish_tile_size
        DesignDepthLbl.text = selectedProductt?.design_depth
        FinishLbl.text = selectedProductt?.design_type_finish
        
       // proID = selectedProduct?.product_id
        
      
        
        let ProId = selectedProductt?.product_id
        let custId = "99"
        let sId = "1"
        
        let parms : [String : String] = ["product_id" : ProId!,
                                         "customer_id" : custId,
                                         "store_id" : sId]
        
        getProductData(url: Product_URL, parameters: parms)
        
     
        
        func initWith(dict: [String: Any]) {
            
           let f =  RawdataConverter.string(selectedProductt?.customer_id)
            print("-------")
            print(f)
        }
        
        
        if RubberPunchLbl.text == nil{
            RubberPunchLbl.text = "---"
        }
        if RcRubberPunchLbl.text == nil{
            RcRubberPunchLbl.text = "---"
        }
        if ReRubberPunchLbl.text == nil{
            ReRubberPunchLbl.text = "---"
        }
        
  
    }
    
    @IBAction func RubberBtn(_ sender: Any) {
        if RCRubberRadio.isSelected || RERUbberRadio.isSelected{
            RCRubberRadio.isSelected = false
            RERUbberRadio.isSelected = false
            RubberRadio.isSelected = true
        }else{
            RubberRadio.isSelected = true
            radioResponse = selectedProductt?.price
           
        }
    }
    @IBAction func RCRubberBtn(_ sender: Any) {
        if RubberRadio.isSelected || RERUbberRadio.isSelected{
            RubberRadio.isSelected = false
            RERUbberRadio.isSelected = false
            RCRubberRadio.isSelected = true
        }else{
            RCRubberRadio.isSelected = true
            radioResponse = selectedProductt?.rc_rubber_punch_price
           
        }
    }
    @IBAction func RERubberBtn(_ sender: Any) {
        if RubberRadio.isSelected || RCRubberRadio.isSelected{
            RubberRadio.isSelected = false
            RCRubberRadio.isSelected = false
            RERUbberRadio.isSelected = true
        }else{
            RERUbberRadio.isSelected = true
            radioResponse = selectedProductt?.re_rubber_punch_price
           
        }
    }
    
    //MARK: GetData
    
    func getProductData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateProductData(json: RestaurantJSON)
            
                print(respondse)
                
                self.detailsFill()
            }
            else{
                print("Error")
                
            }
        }
    }
    
    func updateProductData(json : JSON)  {
        
        let proDetail = json["productsdetails"].array
        
    }
    
    @IBAction func GeneratePO(_ sender: Any) {
    
        
        //selectedProduct = SharedDataDictionary[indexPath.row]
//        performSegue(withIdentifier: "SegueHomeToSharedMasterRubber", sender: self)
       
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "SegueSharedMasterRubberToGenaratePO",
            let vc = segue.destination as? GenaratePO{
            vc.selectedProduct = selectedProductt
        }
        
    }
    
    func detailsFill() {
        
        RubberPunchLbl.text = selectedProductt?.price
        RcRubberPunchLbl.text = selectedProductt?.rc_rubber_punch_price
        ReRubberPunchLbl.text = selectedProductt?.re_rubber_punch_price
        DieSizeLbl.text = ("\(String(describing: selectedProductt?.die_size_width)) x \(selectedProductt?.die_size_height) x \(selectedProductt?.die_size_thickness)")
        
        
        print("---------")
        print(selectedProductt?.price as Any)
        print(selectedProductt?.rc_rubber_punch_price as Any)
        print(selectedProductt?.re_rubber_punch_price as Any)
    }
    
}
