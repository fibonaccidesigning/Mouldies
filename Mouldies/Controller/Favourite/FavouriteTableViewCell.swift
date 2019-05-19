//
//  FavouriteTableViewCell.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 13/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet var NameLbl: UILabel!
    @IBOutlet var PriceLbl: UILabel!
    @IBOutlet var FinalTileSize: UILabel!
    @IBOutlet var DesignDepthLbl: UILabel!
    @IBOutlet var FinishLbl: UILabel!
    @IBOutlet var ProductImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
