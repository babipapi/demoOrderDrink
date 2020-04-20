//
//  DrinkMenuTableViewCell.swift
//  demoOrderDrink
//
//  Created by Daniel on 2020/4/12.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class DrinkMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
