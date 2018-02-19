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
    let lawyerInfo = ["الاسم ","المجالات المختص بها" , "البريد الإلكتروني" , "رقم الجوال"]
    let clientInfo = ["الاسم ","الجنس " , "البريد الإلكتروني" , "رقم الجوال"]

    var infor = [String]()
     var ref : DatabaseReference!
    var info=[profileDetails]()

    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame:.zero)
        self.image.layer.cornerRadius = self.image.frame.size.height / 2
        self.image.clipsToBounds = true

        super.viewDidLoad()
        /*
   let userID = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child("users").child(userID!)
            ref.observeSingleEvent(of: .value, with:{ (snapshot) in
            
                    for users in snapshot.children.allObjects as! [DataSnapshot] {
                        
                        let userObject = users.value as? [String: AnyObject]
                        let lawyerName = userObject?["fullName"] as! String
                        let email = userObject?["email"] as! String
                        let phone = userObject?["phoneNo"] as! String
                        let lawyerId = userObject?["ID"] as! String
                        
                        let details = profileDetails( fullName: lawyerName , email: email  , phoneNo: phone)
                        
                        self.info.append(details)
                        self.infor.append(lawyerName)
                        self.infor.append(email)
                        self.infor.append(phone)
                        self.infor.append(lawyerId)
                }
                
 
                
            }) */
            
    } //end function
    

    
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
    return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileDataTableViewCell
//        let lawyerInfo : profileDetails
       // lawyerInfo = info[indexPath.row]
        
      //  cell.title.text = str[indexPath.row]
       // cell.subtitle.text = infor[indexPath.row]
        
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
