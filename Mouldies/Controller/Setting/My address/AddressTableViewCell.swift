//
//  AddressTableViewCell.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 07/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet var FullNameLbl: UILabel!
    @IBOutlet var AddressLbl: UILabel!
    @IBOutlet var CityStateLbl: UILabel!
    @IBOutlet var CountryPincodeLbl: UILabel!
    @IBOutlet var MobileLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
