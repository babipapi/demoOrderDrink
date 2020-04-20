//
//  OrderListTableViewCell.swift
//  demoOrderDrink
//
//  Created by Daniel on 2020/4/18.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var drinkname: UILabel!
    @IBOutlet weak var ice: UILabel!
    @IBOutlet weak var suger: UILabel!
    @IBOutlet weak var bubble: UILabel!
    @IBOutlet weak var capacity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
