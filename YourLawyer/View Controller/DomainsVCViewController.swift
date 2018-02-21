//
//  DomainsVCViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/7/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class DomainsVCViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    var legaldomain = [String]()
    var ref = DatabaseReference.init()
     @IBOutlet weak var domains: UITableView!

   
    override func viewDidLoad() {
         self.ref = Database.database().reference()
        domains.delegate = self
        domains.dataSource = self
        super.viewDidLoad()
        ref.child("domain").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let  domain = value?["domainName"]as? String
            if let d = domain{
                
                self.legaldomain.append(d)
            }
            self.domains.reloadData()
            
        // Do any additional setup after loading the view.
    })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legaldomain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = domains.dequeueReusableCell(withIdentifier: "domaincell") as! DisplayDomainsTableViewCell
        cell.title.text = legaldomain[indexPath.row]
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
