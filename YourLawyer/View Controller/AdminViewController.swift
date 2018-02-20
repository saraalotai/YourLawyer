//
//  AdminViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/20/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let storyborad = UIStoryboard(name:"Main",bundle:nil)
        let signInVC = storyborad.instantiateViewController(withIdentifier: "Main")
        self.present(signInVC, animated: true, completion: nil)
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
