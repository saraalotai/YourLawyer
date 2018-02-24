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
        let phone = phoneNo.text
        let userid = Auth.auth().currentUser!.uid
        let userRe = Database.database().reference().child("users/\(userid)")
        
        userRe.observe(.value, with: { (snapshot) in
            
            let usersD = profileDetails(snapshot: snapshot)
            let ID = usersD.ID
            let type = usersD.type
            let gender = usersD.gender
            let pass = usersD.password
            let UserImage = usersD.UserImage
            let city = usersD.city
            let cardImage = usersD.cardImage
            let legalDomain = usersD.legalDomain
            self.updatInfo(ID : ID! ,fullName: name!, Phone : phone!, officeName: officename!, cardNo: card!, email:emaill!, UserImage: UserImage!, type: type!, pass: pass!, gender: gender!,city: city!, cardImage:cardImage!,legalDomain: legalDomain!)
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updatInfo(ID : String,fullName: String, Phone: String, officeName: String, cardNo: String, email: String, UserImage: String, type: String, pass: String,  gender: String, city:String , cardImage:String ,legalDomain: String){
        
        let information = [ "ID":ID ,"PhoneNo":Phone,"UserImage":UserImage,"cardNo":cardNo, "city":city, "email": email, "fullName": fullName,"gender":gender,"imagepath":cardImage,"legalDomain":legalDomain,"officeName": officeName,"password":pass , "type":type]
        let userID = Auth.auth().currentUser!.uid
        let userRef = Database.database().reference()
        userRef.child("users/\(userID)").setValue(information)
    }
}

