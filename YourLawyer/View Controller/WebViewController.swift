//
//  WebViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/22/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import MessageUI
import Firebase
class WebViewController: UIViewController {
    var Template: agreement!
    var HTMLContent: String!
   
    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
         createHTML()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createHTML() {

Template = agreement()
        if let HTML = Template.changeContent(IssueeNumber: "12345", IssueDate: "1/1/2018", ClientName: "احمد العنزي"){
            web.loadHTMLString(HTML, baseURL: NSURL(string: Template.pathHTMLTemplate!)! as URL)
            HTMLContent = HTML
      
    
        }
    }
    
    @IBAction func Review(_ sender: Any) {
        

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
