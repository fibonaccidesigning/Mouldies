//
//  Home.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 30/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Home: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, iCarouselDelegate, iCarouselDataSource {
    
    
    //MARK: DataModel
    
    let homeDataModel = MouldiesDataModel()
    
    var selectedProduct : SharedDataModel?
    var selectedSeller : SellerDataModel?
    var selectSub : SubscriptionsDataModel?
    
    
    //MARK: Variable
    
     static let Nart = "articles"
    
    var useData : [SellerDataModel] = []
    var SharedDataDictionary : [SharedDataModel] = []

    
    var imageArr = [UIImage(named: "B1"),
                    UIImage(named: "B2"),
                    UIImage(named: "B3")]
    
  
    var plan_idd = 2
    
    
    
    //MARK: URL
    
    let ListSeller_URL = "http://test.mouldies.com/shop/listSeller"
    let Customer_URL = "http://test.mouldies.com/shop/GetRubberpunchproduct"
    
    
    
    //MARK: ViewControllers
    
    @IBOutlet var SharedMasterCollection: UICollectionView!
    @IBOutlet var OurSellerCollection: UICollectionView!
    @IBOutlet var SharedVC: UIButton!
    @IBOutlet var StandardVC: UIButton!
    @IBOutlet var PremiumVC: UIButton!
    @IBOutlet var IclouserView: iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSellerPickerViewData(url: ListSeller_URL)
        self.loadData()
        
        IclouserView.type = .timeMachine
        IclouserView.contentMode = .scaleAspectFit
        IclouserView.isPagingEnabled = true
        
        self.removeTabbarItemsText()
      
    }
    
    
    // MARKD: SharedMaster CollectionView
    
    func loadData(){
        
        let custid = "99"
        let parms : [String : String] = ["customer_id" : custid]
        getSharedCollectionData(url: Customer_URL, parameters: parms)
    }
    
    func getSharedCollectionData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let CustomerJSON : JSON = JSON(respondse.result.value!)
                self.updateSharedCollectionViewData(json: CustomerJSON)
                
                print(respondse)
                print(self.homeDataModel.status)
            }
            else{
                print("Error")
            }
        }
    }
    
    func updateSharedCollectionViewData(json : JSON)  {
        

        let pro = json["products"].array
        let range = pro!.count
        
        for i in 0..<range{
    
            SharedDataDictionary.append(SharedDataModel(json: (pro![i].dictionaryObject)!))
            
            self.SharedMasterCollection.reloadData()
            
        }
    }

    
    // MARK: OurSeller CollectionView
    
    func getSellerPickerViewData(url : String) {
        
        Alamofire.request(url, method: .get).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updategetSellerPickerViewData(json: RestaurantJSON)
               
            }
            else{
                print("Error")
            }
        }
        
    }
    
    func updategetSellerPickerViewData(json : JSON)  {
        
//        homeDataModel.seller_storename = json["seller"]["seller_storename"].stringValue
//        homeDataModel.vendor_logo = json["seller"]["vendor_logo"].stringValue
//        
        let sellerr = json["seller"].array
        let range = sellerr!.count
        
        for i in 0..<range{
            
            useData.append(SellerDataModel(json: (sellerr![i].dictionaryObject)!))
            
            self.OurSellerCollection.reloadData()
            
        }

    }
   
    
    //MARK: CollectionView
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == self.SharedMasterCollection{
            
             return SharedDataDictionary.count
            
        }else
        {
           return useData.count
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.SharedMasterCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SharedMasterCell

            let urlD = SharedDataDictionary[indexPath.item].image_url

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
            cell.ItemLabel.text = SharedDataDictionary[indexPath.row].name
            cell.PriceLabel.text = SharedDataDictionary[indexPath.item].price
            
        
            return cell
        }
        else{

            let Sellercell = collectionView.dequeueReusableCell(withReuseIdentifier: "Sellercell", for: indexPath) as! OurSellersCell
            
             let urlD = useData[indexPath.item].vendor_logo

            if let url = URL(string: urlD!){
                do{
                    let data = try Data(contentsOf: url)
                    Sellercell.OurSellerImage.image = UIImage(data: data)
                }
                catch
                {
                    print("Error")
                }
            }

            Sellercell.OurSellerName.text = useData[indexPath.item].seller_storename
            
            //s = SharedDataDictionary[indexPath.item].customer_id!

            return Sellercell

        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.SharedMasterCollection {
            
            selectedProduct = SharedDataDictionary[indexPath.row]
            performSegue(withIdentifier: "SegueHomeToSharedMasterRubber", sender: self)
        }else{
            selectedProduct = SharedDataDictionary[indexPath.row]
            performSegue(withIdentifier: "SegueHomeToSharedMasterRubber", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueHomeToSharedMasterRubber",
            let vc = segue.destination as? SharedMasterRubber{
            vc.selectedProductt = selectedProduct
        }else if segue.identifier == "SegueHomeToSharedMasterRubber",
            let svc = segue.destination as? OurSellerMasterViewController{
                svc.selectedSeller = selectedSeller
        }else if segue.identifier == "SegueHomeToViewAllSharedMaster",
            let svc = segue.destination as? SharedMasterViewController{
            svc.selectedProduct = selectedProduct
        }
    }
    
    
    //MARK: Shared Master View All

    @IBAction func SharedMasterViewwAllBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueHomeToViewAllSharedMaster", sender: self)
        
    }
    
    @IBAction func SharedMasterBtn(_ sender: Any) {
      
 
      
    }
    
    
    @IBAction func StandardMasterBtn(_ sender: Any) {
        
        if selectSub?.plan_id == 1 {
                
                let alert = UIAlertController(title: "Alert!", message: "You are not Standard User", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Done", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil )
            
        }else{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StandardMaster")
//            self.navigationController?.pushViewController(storyboard, animated: true)
            
        }
        
        
    }
    
    @IBAction func PremiumMasterBtn(_ sender: Any) {
        
        if selectSub?.plan_id  == 1 || selectSub?.plan_id  == 2{
            
            let alert = UIAlertController(title: "Alert!", message: "You are not Premium User", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Done", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil )
            
        }else{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PremiumMaster")
//            self.navigationController?.pushViewController(storyboard, animated: true)
        }
    }
    
    
    //MARK: Notifications
    
    @IBAction func NotificationBtn(_ sender: Any) {
       
 
    }
    
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imageArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imgView : UIImageView!
        
        if view == nil{
            imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 250))
            imgView.contentMode = .scaleAspectFit
        }else{
            imgView = view as? UIImageView
        }
        
        imgView.image = imageArr[index]
        
        return imgView
    }
    
    func removeTabbarItemsText() {
        if let items = tabBarController?.tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
            }
        }
    }
    

}

extension String {
    var toIntValue : Int {
        let int = Int(self)
        guard let _int  = int else{ return 0}
        return _int
    }
}
