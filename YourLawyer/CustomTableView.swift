//
//  CustomTableView.swift
//  YourLawyer
//
//  Created by mac on ١٨ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit
class CustomTableView : UITableViewCell
{
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var lawerImage: UIImageView!
    @IBOutlet weak var lawerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
