//
//  IssueViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/5/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase

class IssueViewController: UIViewController , UIPickerViewDataSource ,UIPickerViewDelegate ,UITextFieldDelegate ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
  
    
    @IBOutlet weak var issueType: UITextField!
    
    @IBOutlet weak var lawyer: UITextField!
    
    @IBOutlet weak var dropIssue: UIPickerView!
    
    @IBOutlet weak var dropLawyer: UIPickerView!
    
    var issue = ["جرائم الكترونيه" , "قضايا مدنية"]
    
    var lawyers = ["احمد","سعد"]
    
    var imagePacker:UIImagePickerController!
    
    
    @IBOutlet weak var imageofdoc: UIImageView!
    @IBAction func docPic(_ sender: Any) {
        print("اختر صورة")
        present(imagePacker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let UserUID = Auth.auth().currentUser!.uid

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
           imageofdoc.image = image
            //upload image
            let storageRef = Storage.storage().reference(forURL:"gs://mylawyer-f867a.appspot.com")
            var data = NSData()
            data = UIImageJPEGRepresentation(image , 0.8)! as NSData
            let dataFormat = DateFormatter()
            dataFormat.dateFormat = "MM_DD_yy_hh_mm_a"
       //     let imageName = "\(self.UserUID!)_\(dataFormat.string(from: NSDate() as Date))"
         //   imagepath = "documentsimages/\(imageName).jpg"
         //   let childUserImages = storageRef.child(imagepath)
     //       let metaData = StorageMetadata()
       //     metaData.contentType = "image/jpeg"
        //    childUserImages.putData(data as Data, metadata: metaData)
            //save to database
            
        }
        imagePacker.dismiss(animated: true, completion: nil)
    }
    
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
        imagePacker=UIImagePickerController()
        imagePacker.delegate=self

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
