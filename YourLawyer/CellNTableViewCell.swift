//
//  CellNTableViewCell.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/9/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class CellNTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var notifi: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
