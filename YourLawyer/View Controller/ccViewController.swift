//
//  ccViewController.swift
//  YourLawyer
//
//  Created by rawan on ٧ جما٢، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
class ccViewController: UIViewController {
    var refArtists : DatabaseReference!
    
    @IBOutlet weak var textfild: UITextField!
    @IBOutlet weak var choose: UISegmentedControl!
    @IBAction func butten(_ sender: UIButton) {
        addqustion()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        // Do any additional setup after loading the view.
        
        refArtists = Database.database().reference().child("chat");
        
    }
    func addqustion(){
        let key = refArtists.childByAutoId().key
        
        let artist = ["id":key,
                      "gustion": textfild.text!as String
        ]
        refArtists.child(key).setValue(artist)
        
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
