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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

      
        
        
        
    }
            
            override func viewWillAppear(_ animated: Bool)
            {
                let userID = Auth.auth().currentUser!.uid
                let userRef = Database.database().reference().child("users/\(userID)")
                
                userRef.observe(.value, with: { (snapshot) in
                    
                    let user = profileDetails(snapshot: snapshot)
                    
                    self.fullName.text = user.fullName
                    self.email.text = user.email
                    self.cardNo.text = user.cardNo
                    self.phoneNo.text = user.phoneNo
                    self.officeName.text = user.officeName
                    
                    
                    
                    
                })
    }
    
    @IBAction func saveUpdatedInfo(_ sender: Any) {
        
        let name = fullName.text
        let card = cardNo.text
        let emaill = email.text
        let officename = officeName.text
        
        self.updatInfo(name: name!, officeName: officename!, cardNo: card!, email:emaill!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updatInfo(name: String, officeName: String, cardNo: String, email: String){
        
        let information = [ "Name": name, "offic name": officeName, "card no":cardNo, "email": email]
        let userID = Auth.auth().currentUser!.uid
        let userRef = Database.database().reference()
        userRef.child("users/\(userID)").setValue(information)
            }
}
