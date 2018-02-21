//
//  ProfileVC.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/8/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
class ProfileVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    //outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var image: UIImageView!
    
   
    
    //varoables
    let lawyerInfo = ["الاسم ","اسم مكتب المحاماة" , "البريد الإلكتروني" , "رقم الجوال"]
    let clientInfo = ["الاسم" , "البريد الإلكتروني" , "رقم الجوال"]
    var information = [String]()

var info=[profileDetails] ()
    
    var ref: DatabaseReference! 
    
 
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame:.zero)
        self.image.layer.cornerRadius = self.image.frame.size.height / 2
        self.image.clipsToBounds = true

        super.viewDidLoad()
        
        let userID = Auth.auth().currentUser!.uid
        let userRef = Database.database().reference().child("users/\(userID)")
        
        userRef.observe(.value, with: { (snapshot) in
            print ("no print")
            let user = profileDetails(snapshot: snapshot)
            self.information.append(user.fullName!)
            self.information.append(user.email!)
            self.information.append(user.phoneNo!)
          //  self.information.append(user.officeName!)
            
        })
     /*
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser!.uid
        
      
        ref = Database.database().reference().child("users/\(userID)")
        
        ref.observe(.value, with: { (snapshot) in
            
            if snapshot.childrenCount>0 {
                
                
                
                for users in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    
                    
                    let userObject = users.value as? [String: AnyObject]
                    
                    let lawyerName = userObject?["fullName"]
                    
                    let email = userObject?["email"]
                    
                    let phone = userObject?["phoneNo"]
                    
                    let cardNo = userObject?["cardNo"]
                    
                    let officeName = userObject?["officeName"]
                    
                    
                    let details = profileDetails( fullName: lawyerName as! String?, email: email as! String?, cardNo: cardNo as! String? ,officeName: officeName as! String?, phonNo: phone as! String?)
                    
                
                    
               // self.info.append(details)
            
        }
            self.tableview.reloadData()
        }
        
        
        
         })
        */
        
        
    }//end function
      
  
   
    
    @IBAction func logout(_ sender: Any) {
        
        do {
           try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let storyborad = UIStoryboard(name:"Main",bundle:nil)
      let signInVC = storyborad.instantiateViewController(withIdentifier: "Main")
        self.present(signInVC, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = Int()
        Database.database().reference().child("users/\(Auth.auth().currentUser!.uid)/type").observeSingleEvent(of: .value, with: {
            (snapshot) in
            switch snapshot.value as! String {
                
            case "client":
                count = self.clientInfo.count
            case "lawyer":
                count = self.lawyerInfo.count
                
            default:
                
                print("Error: Couldn't find type for user \(Auth.auth().currentUser!)")
            }
        })
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileDataTableViewCell
      
        
        cell.title.text = lawyerInfo[indexPath.row]
        cell.subtitle.text = information[indexPath.row]
      
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
