//
//  RegisterLawyerViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/11/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
class RegisterLawyerViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate , UIPickerViewDataSource ,UIPickerViewDelegate ,UITextFieldDelegate{
    //varibles
    var genders = ["ذكر","أُنثى"]
    var UserGender = String()
     var imagePacker:UIImagePickerController!
    var UserUID:String?
       var ref = DatabaseReference.init()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return genders.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
            return genders[row]
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.UserGender = genders[row]
    }
    //Outlest
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var IDTF: UITextField!
    @IBOutlet weak var legalDoTF: UITextField!
    @IBOutlet weak var oficenameTF: UITextField!
    @IBOutlet weak var cardNOTF: UITextField!
    @IBOutlet weak var genderDD: UIPickerView!
    @IBOutlet weak var cardimg: UIImageView!
  
   
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePacker = UIImagePickerController()
        imagePacker.delegate = self
        self.ref = Database.database().reference()
        genderDD.delegate = self
        genderDD.dataSource = self

        // Do any additional setup after loading the view.
    }


    @IBAction func cardButton(_ sender: Any) {
        print("اختر صورة")
        present(imagePacker, animated: true, completion: nil)
    }
    
    var imagepath = ""
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
           cardimg.image = image
            //upload image
            let storageRef = Storage.storage().reference(forURL:"gs://mylawyer-f867a.appspot.com")
            var data = NSData()
            data = UIImageJPEGRepresentation(image , 0.8)! as NSData
            let dataFormat = DateFormatter()
            dataFormat.dateFormat = "MM_DD_yy_hh_mm_a"
            let imageName = "\(self.UserUID ?? "11")_\(dataFormat.string(from: NSDate() as Date))"
            imagepath = "cardimages/\(imageName).jpg"
            let childUserImages = storageRef.child(imagepath)
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            childUserImages.putData(data as Data, metadata: metaData)
            //save to database
           
        }
        imagePacker.dismiss(animated: true, completion: nil)
    }
  
    
    @IBAction func regButton(_ sender: Any) {
        
         let providedEmailAddress = emailTF.text
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        if isEmailAddressValid
        {
            print("Email address is valid")
            
             saveUserInfo(UserImagePath: imagepath, UserName: fullnameTF.text!, email: emailTF.text!, PhoneNo: phoneNoTF.text!, gender: self.UserGender, city: cityTF.text!, password: passwordTF.text!, ID: IDTF.text!, legalDomain: legalDoTF.text!, oficeName: oficenameTF.text!, cardNo: cardNOTF.text!)
        } else {
            print("Email address is not valid")
            displayAlertMessage(messageToDisplay: "Email address is not valid")
        }
        
        
    }
    
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    

    
    
    func saveUserInfo(UserImagePath:String,UserName:String,email:String,PhoneNo:String,gender:String,city:String,password:String,ID:String,legalDomain:String,oficeName:String,cardNo:String){
        
        guard emailTF.text != nil else{
            print("email issue")
            return
        }
        guard fullnameTF.text != nil else
        {
            print("name issue")
            return
        }
        guard passwordTF.text != nil else
        {
            print("password issue")
            return
        }
        guard IDTF.text != nil else
        {
            print("id issue")
            return
        }
        guard phoneNoTF.text != nil else
        {
            print("phone number issue")
            return
        }
        Auth.auth().createUser(withEmail: emailTF.text! , password: passwordTF.text!)
        { (user, error) in
            if  error != nil{
                print(error!)
                return
            }
            guard let uid = user?.uid else{
                return
            }
                self.UserUID = user!.uid
                print("User ID: \(user?.uid)")
                let msg = ["fullName":UserName,
                           "email":email,
                           "PhoneNo":PhoneNo,
                           "gender":gender,
                           "city":city,
                           "password":password,
                           "ID":ID,
                           "legalDomain":legalDomain,
                           "officeName":oficeName,
                           "cardNo":cardNo,
                           "imagepath":UserImagePath,
                           "UserImage":"",
                           "type":"lawyer"]
              self.ref.child("users").child(user!.uid).setValue(msg)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main")
            self.present(vc!, animated: true, completion: nil)
            func viewDidAppear(_ animated: Bool) {
                
            }

            }
        }
    

        
   

}
