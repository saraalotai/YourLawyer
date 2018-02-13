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

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
  
    var UserUID = String()
    @IBAction func login(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else {
            print("Email is empty")
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            print("password is empty")
            return
        }
        
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user: User?, error ) in
            if let error = error{
                print(error)
                
            }else{
                self.UserUID = user!.uid
                print("User ID: \(user?.uid)")
            }
            }
    }

    

}

