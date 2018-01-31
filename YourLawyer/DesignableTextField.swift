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
            let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
           imageView.image = image
            let view = UIView(frame: CGRect(x: 5, y: 0, width: 25, height: 20))
            view.addSubview(imageView)
            rightView = view
        }
        else {
            //image is nil
            rightViewMode = .never
        }
    }

}
