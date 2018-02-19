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
    let str = ["معلومات الحساب","اسم المحامي الكامل" , "البريد الإلكتروني" , "رقم الجوال"]
    var ref : DatabaseReference!
    var info=[profileDetails] ()
    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame:.zero)
        self.image.layer.cornerRadius = self.image.frame.size.height / 2
        self.image.clipsToBounds = true
        super.viewDidLoad()
        
        ref = Database.database().reference().child("users");
    ref.observe(DataEventType.value, with: { (snapshot) in
        if snapshot.childrenCount>0 {
           self.info.removeAll()
            
            for users in snapshot.children.allObjects as! [DataSnapshot] {
                
                let userObject = users.value as? [String: AnyObject]
                let lawyerName = userObject?["fullName"]
                let email = userObject?["email"]
                let phone = userObject?["phoneNo"]
                let lawyerId = userObject?["id"]
            
                let details = profileDetails( fullName: lawyerName as! String? , email: email as! String? , phoneNo: phone as! String?)
                
                self.info.append(details)
            
        }
            self.tableview.reloadData()
        }
        
        
        
         })
        
        
        
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
    return str.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileDataTableViewCell
        let lawyerInfo : profileDetails
        lawyerInfo = info[indexPath.row]
        
        cell.title.text = str[indexPath.row]
        cell.subtitle.text = lawyerInfo.fullName
        cell.subtitle.text = lawyerInfo.email
        cell.subtitle.text = lawyerInfo.phoneNo
        
          return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
