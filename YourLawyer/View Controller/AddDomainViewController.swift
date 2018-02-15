//
//  AddDomainViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/15/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
class AddDomainViewController: UIViewController {
// outlets
    @IBOutlet weak var LegalDomainName: UITextField!
    @IBOutlet weak var keyword: UITextField!
// varibles
    var ref: DatabaseReference!
    var keywords = ""
 
    override func viewDidLoad() {
           ref = Database.database().reference()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddKeyword(_ sender: Any) {
        
        keywords += keyword.text!+","
        keyword.text = ""
        
    }
    
    @IBAction func AddDomain(_ sender: Any) {
        if LegalDomainName.text != "" && keywords != "" {
            self.ref.child("domain").childByAutoId().setValue(["domainName": LegalDomainName.text!,"keyword":self.keywords])
    }// end if
        else
        {
            print("can't be empty")
        }
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
