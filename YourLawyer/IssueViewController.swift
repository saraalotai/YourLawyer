//
//  IssueViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/5/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController , UIPickerViewDataSource ,UIPickerViewDelegate ,UITextFieldDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
  
    
    @IBOutlet weak var issueType: UITextField!
    
    @IBOutlet weak var lawyer: UITextField!
    
    @IBOutlet weak var dropIssue: UIPickerView!
    
    @IBOutlet weak var dropLawyer: UIPickerView!
    
    var issue = ["جرائم الكترونيه" , "قضايا مدنية"]
    
    var lawyers = ["احمد","سعد"]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countraws : Int = issue.count
        if pickerView == dropLawyer {
            countraws = self.lawyers.count
            
        }
        return countraws

    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if pickerView == dropIssue{
            let  titleRow = issue[row]
            return titleRow
        }
        else if pickerView == dropLawyer {
            let titleRow = lawyers[row]
            return titleRow
        }
       return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dropIssue{
            self.issueType.text = issue[row]
            self.dropIssue.isHidden = true
        }
        else if pickerView == dropLawyer{
            self.lawyer.text = lawyers[row]
            self.dropLawyer.isHidden = true
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.issueType){
         self.dropIssue.isHidden = false
            
        }
        else if (textField == self.lawyer){
            self.dropLawyer.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
