//
//  QuestionViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/25/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate , UIPickerViewDataSource ,UIPickerViewDelegate ,UITextFieldDelegate {
    var lawyers = ["احمد","سعد"]
    var choosenLawyer = String()

    

    @IBOutlet weak var LawyerName: UITextField!
    @IBOutlet weak var Lawyers: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return lawyers.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return lawyers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.choosenLawyer = lawyers[row]
    }
}
