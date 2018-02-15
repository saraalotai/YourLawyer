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
    
    var user = User()
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame:.zero)
        self.image.layer.cornerRadius = self.image.frame.size.height / 2
        self.image.clipsToBounds = true
        super.viewDidLoad()
        
        let userRef = Database.database().reference().child("users").child("client")
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            
            for userInfo in snapshot.children {
                self.user = User(snapshot: userInfo as! DataSnapshot)
            }//for
            
           
            
            
          /*  Storage.storage().reference(forURL: self.user.userImage).getData(maxSize: 1024, completion: { (UserImage,error ) in
                
                if let error = error {
                    print(error)
                    
                }
                else{
                    
                    if let data = UserImage {
                        
                        self.image.image = UIImage( data: data)
                        
                    }
                    
                }
            })
            
            */
            
        }//for
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return str.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! ProfileDataTableViewCell
        cell.title.text = str[indexPath.row]
        cell.subtitle.text = Auth.auth().currentUser!.email
        
          return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
