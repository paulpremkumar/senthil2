//
//  DynamicCell.swift
//  Hubblesindia
//
//  Created by admin on 09/12/20.
//  Copyright © 2020 senthil kumar. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {

    @IBOutlet weak var Movieimg: UIImageView!
    @IBOutlet weak var Movienamelb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
