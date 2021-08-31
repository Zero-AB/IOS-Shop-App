//
//  placecategorycell.swift
//  ShopME
//
//  Created by Andrew Bell on 2/27/20.
//  Copyright © 2020 Andrew Bell. All rights reserved.
//

import UIKit

class placecategorycell: UITableViewCell {

    @IBOutlet weak var categoryimage: UIImageView!
    
    @IBOutlet weak var categorylabel: UILabel!
    
    @IBOutlet weak var categorydesc: UILabel!
    
    @IBOutlet weak var categoryprice: UILabel!
    

    @IBOutlet weak var addtocart: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
