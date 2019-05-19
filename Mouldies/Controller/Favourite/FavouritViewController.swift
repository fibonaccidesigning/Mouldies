//
//  FavouritViewController.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 13/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FavouritViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    //MARK: DataModel
    
    let homeDataModel = MouldiesDataModel()
    
    var selectedProduct : SharedDataModel?
    var selectedSeller : SellerDataModel?
    
    
    //MARK: Variable
    
    var useData : [SellerDataModel] = []
    var SharedDataDictionary : [SharedDataModel] = []
    var SharedMasterDataDiceionary : [SharedDataModel] = []
    var proIdDelete = ""
    
    //MARK: URL
    
    let GetWishlist_URL = "http://test.mouldies.com/shop/GetWishlist"
    let RemoveWishlistProduct_URL = "http://test.mouldies.com/shop/RemoveWishlistProduct"
    
    @IBOutlet var FavouritTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func loadData(){
        
        let custid = "99" //selectedProduct?.customer_id
        let parms : [String : String] = ["customer_id" : custid]
        
        getWishListData(url: GetWishlist_URL, parameters: parms)
    }
    
    func getWishListData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateWishListData(json: CustomerJSON)
                
                print(respondse)
            }
            else{
                print("Json Error")
                print(Error.self)
            }
        }
    }
    
    func updateWishListData(json : JSON)  {
        
        let pro = json["wishlist_products"].array
        let range = pro!.count
        
        for i in 0..<range{
            
            SharedMasterDataDiceionary.append(SharedDataModel(json: (pro![i].dictionaryObject)!))
            
            self.FavouritTbl.reloadData()
            
        }
    }

    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedMasterDataDiceionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouriteTableViewCell
        
        let urlD = SharedMasterDataDiceionary[indexPath.item].image_url
        
        if let url = URL(string: urlD!){
            do{
                let data = try Data(contentsOf: url)
                cell.ProductImage.image = UIImage(data: data)
            }
            catch
            {
                print("Error")
            }
        }
        
        
        cell.NameLbl.text = SharedMasterDataDiceionary[indexPath.item].name
        cell.PriceLbl.text = SharedMasterDataDiceionary[indexPath.item].price
        cell.FinalTileSize.text = SharedMasterDataDiceionary[indexPath.item].finish_tile_size
        cell.DesignDepthLbl.text = SharedMasterDataDiceionary[indexPath.item].design_depth
        cell.FinishLbl.text = SharedMasterDataDiceionary[indexPath.item].finish_tile_size
       
        proIdDelete = SharedMasterDataDiceionary[indexPath.item].product_id!
        print(proIdDelete)
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
          // SharedMasterDataDiceionary.remove(at: indexPath).
            FavouritTbl.deleteRows(at: [indexPath], with: .fade)
            deletDataBtn()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueFavouritToSharedMaster",
            let vc = segue.destination as? SharedMasterRubber{
            vc.selectedProductt = selectedProduct
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueFavouritToSharedMaster", sender: self)
    }

    func deletDataBtn() {
        
        let custid = "99"
        let proid = proIdDelete
        
        let parms : [String : String] = ["customer_id" : custid,
                                         "product_id" : proid]
        
        deleteData(url: RemoveWishlistProduct_URL, parameters: parms)
    }
    
    func deleteData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateDeleteWishListData(json: CustomerJSON)
                
                print(respondse)
            }
            else{
                print("Json Error")
                print(Error.self)
            }
        }
    }
    
    func updateDeleteWishListData(json : JSON)  {
        
        let pro = json["wishlist_products"].array
        let range = pro!.count
        
        for i in 0..<range{
            
            SharedMasterDataDiceionary.append(SharedDataModel(json: (pro![i].dictionaryObject)!))
            
            self.FavouritTbl.reloadData()
            
        }
    }
    
    }
