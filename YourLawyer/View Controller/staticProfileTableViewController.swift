//
//  staticProfileTableViewController.swift
//  YourLawyer
//
//  Created by MAC on 06/06/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class staticProfileTableViewController: UITableViewController {
    @IBOutlet weak var lawyerName: UILabel!
    
    @IBOutlet weak var phoneNo: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var officeName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool)
    {
        let userID = Auth.auth().currentUser!.uid
        let userRef = Database.database().reference().child("users/\(userID)")
        
        userRef.observe(.value, with: { (snapshot) in
            print ("no print")
            
            let user = profileDetails(snapshot: snapshot)
            
            self.lawyerName.text = user.fullName
            self.phoneNo.text = user.phoneNo
            self.officeName.text = user.officeName
            
                    
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
