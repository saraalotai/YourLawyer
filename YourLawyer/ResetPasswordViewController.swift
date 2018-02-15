//
//  ResetPasswordViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/15/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

import FirebaseAuth

import Firebase
class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func restpassword(email:String)
    {
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if error == nil{
                
                print("we will send the email ")
              
            }
                
            else {
                
                print(error!.localizedDescription)
                
            }
        }
    }
    @IBAction func recoverButtonTapped(_ sender: Any) {
        self.restpassword(email: userEmail.text!)
        
    }// end func
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func restpassword(email:String)
    {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil{
                print("we will send the email ")
                
            }
            else {
                print(error!.localizedDescription)
            }
            
        }
        
    }
    @IBAction func recoverButtonTapped(_ sender: AnyObject) {
        

}//end class
