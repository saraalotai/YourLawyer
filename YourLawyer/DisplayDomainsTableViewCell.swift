//
//  DisplayDomainsTableViewCell.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/7/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class DisplayDomainsTableViewCell: UITableViewCell {

    @IBOutlet weak var domain: UIView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
