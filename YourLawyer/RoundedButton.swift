//
//  RoundedButton.swift
//  YourLawyer
//
//  Created by mac on ١٥ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit
class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2/UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
override func layoutSubviews() {
    super.layoutSubviews()
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    layer.masksToBounds = false
    layer.shadowRadius = 1.0
    layer.shadowOpacity = 0.5
    layer.cornerRadius = frame.height/2
    layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.lightGray.cgColor
}
}
