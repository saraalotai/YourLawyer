//
//  DesignableTextField.swift
//  YourLawyer
//
//  Created by mac pro retina on 1/30/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var rightImage:UIImage? {
        didSet{
           updateView()
        }
    }
    func updateView(){
        if let image = rightImage {
            rightViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
           imageView.image = image
            rightView = imageView
        }
        else {
            //image is nil
            rightViewMode = .never
        }
    }

}
