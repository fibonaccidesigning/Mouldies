//
//  SettingTableViewCell.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 06/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet var SettingImage: UIImageView!
    @IBOutlet var SettingName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
