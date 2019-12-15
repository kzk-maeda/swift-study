//
//  CustomCell.swift
//  Swift5ChatApp1
//
//  Created by Kazuki Maeda on 2019/12/16.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
