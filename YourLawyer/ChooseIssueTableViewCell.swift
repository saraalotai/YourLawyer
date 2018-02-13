//
//  ChooseIssueTableViewCell.swift
//  YourLawyer
//
//  Created by mac on ٢٦ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit

class ChooseIssueTableViewCell: UITableViewCell {

    @IBOutlet weak var issueView: UIView!
    @IBOutlet weak var clinetName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
