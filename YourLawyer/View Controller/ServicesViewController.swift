//
//  ServicesViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/19/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ServicesViewController: UIViewController {

    @IBOutlet weak var serviceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().child("users/\(Auth.auth().currentUser!.uid)/type").observeSingleEvent(of: .value, with: {
            (snapshot) in
            switch snapshot.value as! String {
                
            case "client":
              
                self.serviceLabel.text = "طلب إستشارة قانونية"
            case "lawyer":
                
                self.serviceLabel.text = "تقديم إستشارة قانونية"
                
            default:
                print("Error: Couldn't find type for user \(Auth.auth().currentUser!)")
            }
        })

            // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func service(_ sender: Any) {
        
        Database.database().reference().child("users/\(Auth.auth().currentUser!.uid)/type").observeSingleEvent(of: .value, with: {
            (snapshot) in
            switch snapshot.value as! String {
                
            case "client":
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "clientS")
                self.present(vc!, animated: true, completion: nil)
            case "lawyer":
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "lawyerS")
                self.present(vc!, animated: true, completion: nil)
                
            default:
                print("Error: Couldn't find type for user \(Auth.auth().currentUser!)")
            }
        })

        
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
