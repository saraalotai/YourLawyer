//
//  ListDomainsViewController.swift
//  YourLawyer
//
//  Created by mac on ٢٥ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ListDomainsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
  var ref = DatabaseReference.init()
    var legaldomain = [String]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legaldomain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "domain") as! DomainsTableViewCell
        cell.title.text = "قضايا "+legaldomain[indexPath.row]
    return cell
        
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        self.ref = Database.database().reference()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView(frame:.zero)
        super.viewDidLoad()
        
      ref.child("domain").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let  domain = value?["domainName"]as? String
            if let d = domain{
            
                self.legaldomain.append(d)
            }
                self.tableview.reloadData()
            
        })
        // Do any additional setup after loading the view.
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
