//
//  ProfileViewController.swift
//  YourLawyer
//
//  Created by mac on ٢٠ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var infotable: UITableView!
    let info = ["الاسم","اسم الشركة","البريد الإلكتوني","المجالات التي يعمل بها "]
    
    override func viewDidLoad() {
        infotable.delegate = self
        infotable.dataSource = self
        super.viewDidLoad()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infocell = infotable.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
        infocell.title.text = info[indexPath.row]
        return infocell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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

