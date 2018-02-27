//
//  ChooseIssueViewController.swift
//  YourLawyer
//
//  Created by mac on ٢٦ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChooseIssueViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableview: UITableView!
    
    var ref : DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var postData=[String]()
    let names = ["1", "2","3"]
    var str = String()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "issue") as! ChooseIssueTableViewCell
        cell.clinetName.text = names[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        ////////
        databaseHandle = ref?.child("domain").observe(.childAdded, with: { (snapshot) in
            
            let post = snapshot.value as? String
            
            if let actualPost = post{
                self.postData.append(actualPost)
                ////
                self.tableview.reloadData()
            }
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

