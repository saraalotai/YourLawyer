//
//  ViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 1/28/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    //Outlet
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    //Varibles
    var ref = DatabaseReference.init()
    override func viewDidLoad() {
        self.ref = Database.database().reference()
        
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    var UserUID = String()
    @IBAction func login(_ sender: Any) {
        if  self.emailTF.text == "" || self.passwordTF.text == "" {
            let alert = UIAlertController(title: "خطأ", message: "من فضلك ادخل بريدك الإلكتروني وكلمة المرور", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
            return
        }else
        {
            Auth.auth().signIn(withEmail: self.emailTF.text!, password: self.passwordTF.text!, completion: { (user, error) in
                if let error = error{
                   
                    let alert = UIAlertController(title: "خطأ", message: "البريد الإلكتروني او كلمة المرور خاطئة", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                    return
                    
        
                }else
                {
                    // Notice "observeSingleEvent", so we don't register for getting an update every time it changes.
                    Database.database().reference().child("users/\(user!.uid)/type").observeSingleEvent(of: .value, with: {
                        (snapshot) in
                        switch snapshot.value as! String {
                        // If our user is admin...
                        case "admin":
                            // ...redirect to the admin page
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AdminVC")
                            self.present(vc!, animated: true, completion: nil)
                                
                        // If out user is a regular user...
                        case "client":
                            // ...redirect to the user page
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                            self.present(vc!, animated: true, completion: nil)
                            func viewDidAppear(_ animated: Bool) {

                            }
                        case "lawyer":
                            // ...redirect to the user page
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                            self.present(vc!, animated: true, completion: nil)
                        // If the type wasn't found...
                        default:
                            // ...print an error
                            print("Error: Couldn't find type for user \(user!.uid)")
                        }
                    })
              
                }
                
                })// end auth
}

    }
    
}// end class

