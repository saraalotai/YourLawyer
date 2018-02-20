//
//  EditViewController.swift
//  YourLawyer
//
//  Created by MAC on 03/06/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class EditViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var cardNo: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    
    @IBOutlet weak var officeName: UITextField!
    
    var user : profileDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let userRef = Database.database().reference().child("users")
        
        userRef.observe(.value, with: { (snapshot) in
            
            for UserInfo in snapshot.children {
                
                self.user = profileDetails(snapshot: UserInfo as! DataSnapshot)
                
            } //for
            
            
            
            self.fullName.text = self.user.fullName
            self.email.text = self.user.email
            self.cardNo.text = self.user.cardNo
            self.phoneNo.text = self.user.phoneNo
            self.officeName.text = self.user.officeName
            
            
            
        })
      
        
        
        
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
