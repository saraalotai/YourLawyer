//
//  RoundedImage.swift
//  YourLawyer
//
//  Created by mac on ١٨ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit

class RoundedImage : UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderWidth = 5
        self.clipsToBounds = true
    }
    
}
