//
//  RegisterClientViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/13/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterClientViewController: UIViewController, UIPickerViewDataSource ,UIPickerViewDelegate ,UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var IDTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var genderPV: UIPickerView!
    @IBOutlet weak var PhoneNoTF: UITextField!
    //Varibles
    var ref = DatabaseReference.init()
 var genders = ["ذكر","أُنثى"]
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
        genderTF.text = genders[row]
    }
    
    override func viewDidLoad() {
         self.ref = Database.database().reference()
        super.viewDidLoad()
        genderPV.delegate = self
        genderPV.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Register(_ sender: Any) {
        signup()
    }
    func signup()
    {
        guard emailTF.text != nil else{
            print("email issue")
            return
        }
        guard nameTF.text != nil else
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
        guard PhoneNoTF.text != nil else
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
            let msg = ["fullName":self.nameTF.text!,
                       "email":self.emailTF.text!,
                       "PhoneNo":self.PhoneNoTF.text!,
                       "gender":self.genderTF.text!,
                       "password":self.passwordTF.text!,
                       "ID":self.IDTF.text!,
                       "UserImage":"",
                       "type":"client"]
            self.ref.child("users").child(user!.uid).setValue(msg)
                print("User ID: \(user?.uid)")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main")
            self.present(vc!, animated: true, completion: nil)
            func viewDidAppear(_ animated: Bool) {
                
            }
            }
        
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
