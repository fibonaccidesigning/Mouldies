//
//  SharedDataModel.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 11/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import Foundation

class SharedDataModel {
    
    var ProductId = "product_id"
    var Name = "name"
    var Price = "price"
    var Image_URL = "image_url"
    var DesignType =  "design_type_finish"
    var DesignDepth = "design_depth"
    var IsFreelancer =  "is_freelancer_product"
    var DesignPrice = "design_price"
    var SubscriptionPlan = "subscription_plan"
    var FinihTile =  "finish_tile_size"
    var IsWishListed = "is_wishlisted"
    var WishListed = "wishlistId"
    var WaterMark = "watermark_image"
    
    
    
    var Sku = "sku"
    var Set =  "set"
    var Typ = "type"
    var RcRubber = "rc_rubber_punch_price"
    var ReRubber = "re_rubber_punch_price"
    var Stock = "stock"
    var SmallImg = "small_image"
    var Descri = "description"
    var ShortDesc = "short_description"
    var ProdTags = "product_tags"
    var Thik = "thickness"
    var FinishTileWeight = "finish_tile_size_width"
    var FinishTileHeight = "finish_tile_size_height"
    var TotalDepth = "total_depth"
    var VMCPrice = "vmc_price"
    var DieHeight = "die_size_height"
    var DieWeight = "die_size_width"
    var DieThickness = "die_size_thickness"
    var LineWork = "line_work"
    var JoinFree = "joint_free"
    var GreyScaleAva = "greyscale_available"
    var LayOut = "layout_available"
    var CompitableSiz = "compitable_size"
    var VMCApplicable = "vmc_applicable"
    var WishList = "wishlist"
    var CurrencySymbol = "currency_symbol"
    var CustomerID = "customer_id"
    
    
    var titleNotification = "title"
    var msgNotificition = "message"
    var bannerNotification = "banner"
    var thumbNotification = "thumbnail"
    var AddressID = "address_id"
    
    var ordID =  "order_id"
    var incrementID = "increment_id"
    var gardTotal =  "grand_total"
    var statuss = "status"
    var createdAT = "created_at"
    var updateAT = "updated_at"
    var ordType = "order_type"
    var shipTo = "ship_to"
    
    
    
    
    
    var product_id : String?
    var name : String?
    var price: String?
    var image_url : String?
    var design_type_finish : String?
    var design_depth : String?
    var is_freelancer_product : String?
    var design_price : String?
    var subscription_plan : String?
    var finish_tile_size : String?
    var is_wishlisted : String?
    var wishlistId : String?
    var watermark_image : String?
    var customer_id : Int?
    
    var sku : String?
    var set : String?
    var type : String?
    var rc_rubber_punch_price : String?
    var re_rubber_punch_price : String?
    var stock : String?
    var small_image : String?
    var description : String?
    var short_description : String?
    var product_tags : String?
    var thickness : String?
    var finish_tile_size_width : String?
    var finish_tile_size_height : String?
    var total_depth : String?
    var vmc_price : String?
    var die_size_height : String?
    var die_size_width : String?
    var die_size_thickness : String?
    var line_work : String?
    var joint_free : String?
    var greyscale_available : String?
    var layout_available : String?
    var compitable_size : String?
    var vmc_applicable : String?
    var wishlist : String?
    var currency_symbol : String?

    
    var title : String?
    var message : String?
    var banner : String?
    var thumbnail : String?
    var address_id : String?
    
    
    var order_id : String?
    var increment_id : String?
    var grand_total : String?
    var  status : String?
    var created_at : String?
    var updated_at : String?
    var order_type : String?
    var ship_to : String?
    
    
  
    init(json: [String : Any?]) {
        
        if let value = json[Name] as? String {
            self.name = value
        }
        if let value = json[ProductId] as? String {
            self.product_id = value
        }
        if let value = json[Price] as? String {
            self.price = value
        }
        if let value = json[Image_URL] as? String {
            self.image_url = value
        }
        if let value = json[DesignType] as? String {
            self.design_type_finish = value
        }
        if let value = json[DesignDepth] as? String {
            self.design_depth = value
        }
        if let value = json[IsFreelancer] as? String {
            self.is_freelancer_product = value
        }
        if let value = json[DesignPrice] as? String {
            self.design_price = value
        }
        if let value = json[SubscriptionPlan] as? String {
            self.subscription_plan = value
        }
        if let value = json[FinihTile] as? String {
            self.finish_tile_size = value
        }
        if let value = json[WishListed] as? String {
            self.wishlistId = value
        }
        
        if let value = json[WaterMark] as? String {
            self.watermark_image = value
        }
        if let value = json[Sku] as? String {
            self.sku = value
        }
        if let value = json[Set] as? String {
            self.set = value
        }
        if let value = json[Typ] as? String {
            self.type = value
        }
        if let value = json[RcRubber] as? String {
            self.rc_rubber_punch_price = value
        }
        if let value = json[ReRubber] as? String {
            self.re_rubber_punch_price = value
        }
        if let value = json[Stock] as? String {
            self.stock = value
        }
        if let value = json[SmallImg] as? String {
            self.small_image = value
        }
        if let value = json[Descri] as? String {
            self.description = value
        }
        if let value = json[ShortDesc] as? String {
            self.short_description = value
        }
        if let value = json[ProdTags] as? String {
            self.product_tags = value
        }
        if let value = json[Thik] as? String {
            self.thickness = value
        }
        if let value = json[FinishTileWeight] as? String {
            self.finish_tile_size_width = value
        }
        if let value = json[FinishTileHeight] as? String {
            self.finish_tile_size_height = value
        }
        if let value = json[TotalDepth] as? String {
            self.total_depth = value
        }
        if let value = json[VMCPrice] as? String {
            self.vmc_price = value
        }
        if let value = json[DieHeight] as? String {
            self.die_size_height = value
        }
        if let value = json[DieWeight] as? String {
            self.die_size_width = value
        }
        if let value = json[DieThickness] as? String {
            self.die_size_thickness = value
        }
        if let value = json[LineWork] as? String {
            self.line_work = value
        }
        if let value = json[JoinFree] as? String {
            self.joint_free = value
        }
        if let value = json[GreyScaleAva] as? String {
            self.greyscale_available = value
        }
        if let value = json[LayOut] as? String {
            self.layout_available = value
        }
        if let value = json[CompitableSiz] as? String {
            self.compitable_size = value
        }
        if let value = json[VMCApplicable] as? String {
            self.vmc_applicable = value
        }
        if let value = json[WishList] as? String {
            self.wishlist = value
        }
        if let value = json[CurrencySymbol] as? String {
            self.currency_symbol = value
        }
        if let cid = json[CustomerID] as? Int {
            self.customer_id = cid
        }
        
        if let cid = json[titleNotification] as? String {
            self.title = cid
        }
        if let cid = json[msgNotificition] as? String {
            self.message = cid
        }
        if let cid = json[bannerNotification] as? String {
            self.banner = cid
        }
        if let cid = json[thumbNotification] as? String {
            self.thumbnail = cid
        }
        
        if let cid = json[AddressID] as? String{
            self.address_id = cid
        }
        
        
        
        if let cid = json[shipTo] as? String{
            self.ship_to = cid
        }
        if let cid = json[ordType] as? String{
            self.order_type = cid
        }
        if let cid = json[updateAT] as? String{
            self.updated_at = cid
        }
        if let cid = json[createdAT] as? String{
            self.created_at = cid
        }
        if let cid = json[statuss] as? String{
            self.status = cid
        }
        if let cid = json[gardTotal] as? String{
            self.grand_total = cid
        }
        if let cid = json[incrementID] as? String{
            self.increment_id = cid
        }
        if let cid = json[ordID] as? String{
            self.order_id = cid
        }
        
       
        
    }
    
}

