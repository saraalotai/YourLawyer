//
//  MyIssueTableViewCell.swift
//  YourLawyer
//
//  Created by MAC on 25/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class MyIssueTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var status: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
