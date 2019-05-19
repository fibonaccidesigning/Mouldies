//
//  NotificationTableViewCell.swift
//  Mouldies
//
//  Created by Parth Mandaviya on 15/02/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet var NotificationImage: UIImageView!
    @IBOutlet var NotificationTitle: UILabel!
    @IBOutlet var NotificationMsg: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
