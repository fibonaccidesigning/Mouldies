//
//  OrderTableViewCell.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 08/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet var OrderNumberLbl: UILabel!
    @IBOutlet var DateLbl: UILabel!
    @IBOutlet var StatusLbl: UILabel!
    @IBOutlet var ShipNameLbl: UILabel!
    @IBOutlet var TotalLbl: UILabel!
    @IBOutlet var StatusImg: UIImageView!
    @IBOutlet var ShipImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
