//
//  LawyerListViewController.swift
//  YourLawyer
//
//  Created by mac on ١٨ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit

class LawyerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let names = ["احمد","عبدالله","ياسر"]
    @IBOutlet weak var tableview: UITableView!
     @IBOutlet weak internal var edit: UIBarButtonItem!
    
    @IBOutlet weak var lawyername: UILabel!
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {// the number of lawyers
        return names.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableView
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.lawerName.text = names[indexPath.row]
        cell.lawerImage.image = UIImage(named: "user.png")
        cell.lawerImage.layer.cornerRadius = cell.lawerImage.frame.height / 2
        cell.lawerImage.clipsToBounds = true
        return cell
    }
    

}
