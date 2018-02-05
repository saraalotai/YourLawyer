//
//  LawyerProfileViewController.swift
//  YourLawyer
//
//  Created by MAC on 19/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class LawyerProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let account="@lawyerFahad"
    @IBOutlet weak var tableview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    

    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellT") as! CTableViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.lawerAccount.text = account
        cell.lawerImage.image = UIImage(named: "user.png")
        cell.lawerImage.layer.cornerRadius = cell.lawerImage.frame.height / 2
        return cell
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
