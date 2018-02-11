//
//  MyIssuesTableViewCell.swift
//  YourLawyer
//
//  Created by MAC on 24/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class MyIssuesTableViewCell: UITableViewCell {
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
