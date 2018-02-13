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
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
            if let error = error{
                print(error)
                
            }else{
                self.UserUID = user!.uid
                print("User ID: \(user?.uid)")
            }
        }
    }
    

}

