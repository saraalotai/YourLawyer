//
//  LawyerListViewController.swift
//  YourLawyer
//
//  Created by mac on ١٨ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class LawyerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    //varibles
    var names = [String]()
    var office = [String]()
    var filterData = [String]()
    var isSearch = false
     var ref = DatabaseReference.init()
    //outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchLawyer: UISearchBar!
    
    override func viewDidLoad() {
         self.ref = Database.database().reference()
        tableview.delegate = self
        tableview.dataSource = self
        searchLawyer.delegate = self
        super.viewDidLoad()
        ref.child("users").observe(.childAdded, with: { (snapshot) in
           
            let value = snapshot.value as? NSDictionary
            let  LawyerName = value?["fullName"]as? String
            let  officeName = value?["officeName"]as? String
            let  isLawyer = value?["type"]as? String
            if isLawyer == "lawyer"{
              
                self.names.append(LawyerName!)
                self.office.append(officeName ?? "لا يوجد")
               
            }
            else
            {
                print("Error")
            }
            self.tableview.reloadData()
            
        })
        // Do any additional setup after loading the view.
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {// the number of lawyers
        if isSearch {
            return filterData.count
        }
        return names.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableview.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableView
        if isSearch {
            
            cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
            cell.lawerName.text = filterData[indexPath.row]
            cell.officeName.text = office[indexPath.row]
            cell.lawerImage.image = UIImage(named: "avatar.png")
            cell.lawerImage.layer.cornerRadius = cell.lawerImage.frame.height / 2
            cell.lawerImage.clipsToBounds = true
            return cell
            
        }else{

        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.lawerName.text = names[indexPath.row]
        cell.officeName.text = office[indexPath.row]
        cell.lawerImage.image = UIImage(named: "avatar.png")
        cell.lawerImage.layer.cornerRadius = cell.lawerImage.frame.height / 2
        cell.lawerImage.clipsToBounds = true
            return cell
            
        }// end else
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearch = false
            
            view.endEditing(true)
            
            tableview.reloadData()
            
        } else {
            
            isSearch = true
            
            filterData = names.filter({$0 == searchBar.text})
            tableview.reloadData()
        }
    }

}
