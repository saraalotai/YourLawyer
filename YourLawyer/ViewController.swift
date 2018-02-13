//
//  ViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 1/28/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
  
    var UserUID = String()
    @IBAction func login(_ sender: Any) {
        
        if emailTF.text != ""  &&  passwordTF.text != "" {
            
            Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!, completion:{ (user, error )in
            if user != nil
            {// log in successful
                self.performSegue(withIdentifier: "Home", sender: self)
            }// end if
            else {
                if let myError = error?.localizedDescription
                {    print(myError)
                    
                }//end else
                else{
                    print("error")
                    return
                }
            }
            })// end auth
        }
      
            }// end login
    }



