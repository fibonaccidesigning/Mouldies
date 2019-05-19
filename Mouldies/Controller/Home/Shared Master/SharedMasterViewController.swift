//
//  SharedMasterViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 05/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SharedMasterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //MARK: DataModel
    
    let sharedMasterDataModel = MouldiesDataModel()
    var selectedProduct : SharedDataModel?
    
    var SharedMasterDataDiceionary : [SharedDataModel] = []
    
    // MARK: Variable
    
    var fatchingMore = false
    var items = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    

    //MARK: URL
    
    let ProductList_URL = "http://test.mouldies.com/shop/getProductList"
    
    
    
    @IBOutlet var SharedCollectionVC: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func loadData(){
        
        let cat = "4"
        let custid = "99"
        let home = "1"
        let subsc = "1"
        let pag = "1"
        
        let parms : [String : String] = ["cat_id" : cat,
                                        "customer_id" : custid,
                                        "flag_home" : home,
                                        "subscription_id" : subsc,
                                        "page" : pag]
        
        getSharedPickerViewData(url: ProductList_URL, parameters: parms)
    }
    
    func getSharedPickerViewData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateSharedPickerViewData(json: CustomerJSON)
                
                print(respondse)
            }
            else{
                print("Json Error")
                print(Error.self)
            }
        }
    }
    
    func updateSharedPickerViewData(json : JSON)  {
        
        let pro = json["products"].array
        let range = pro!.count
        
        for i in 0..<range{

        SharedMasterDataDiceionary.append(SharedDataModel(json: (pro![i].dictionaryObject)!))
            
            self.SharedCollectionVC.reloadData()
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SharedMasterDataDiceionary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SharedMasterCollectionViewCell
        
        let urlD = SharedMasterDataDiceionary[indexPath.item].image_url
        
        if let url = URL(string: urlD!){
            do{
                let data = try Data(contentsOf: url)
                cell.SharedMasterImage.image = UIImage(data: data)
            }
            catch
            {
                print("Error")
            }
        }
        
        let subsc = SharedMasterDataDiceionary[indexPath.item].subscription_plan
        
        if subsc == "1"{
             cell.BadgeLabel.text = "Shared"
        }else if subsc == "2"{
            cell.BadgeLabel.text = "Standard"
        }else if subsc == "3"{
            cell.BadgeLabel.text = "Premium"
        }else{
            cell.BadgeLabel.text = "Freelancer"
        }
       
      
        cell.SharedMasterNameLbl.text = SharedMasterDataDiceionary[indexPath.item].name
        cell.SharedMasterPriceLbl.text = SharedMasterDataDiceionary[indexPath.item].price
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedProduct = SharedMasterDataDiceionary[indexPath.row]
        performSegue(withIdentifier: "SegueSharedMasterViewControllerToSharedMasterRubber", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueSharedMasterViewControllerToSharedMasterRubber",
            let vc = segue.destination as? SharedMasterRubber{
            vc.selectedProductt = selectedProduct
        }
    }
    
    // MARK: Collection
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        print("offsetX:\(offsetY) | Content Height: \(contentHeight)")
        
        if offsetY > contentHeight - scrollView.frame.height{
            if !fatchingMore {
                beginFatch()
            }
        }
        
    }
    
    func beginFatch() {
        fatchingMore = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let newItem = (self.items.count...self.items.count + 12).map {Index in Index}
            
            self.items.append(contentsOf: newItem)
            self.fatchingMore = false
            self.SharedCollectionVC.reloadData()
        }
    }
    
    

}



