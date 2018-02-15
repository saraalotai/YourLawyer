//
//  LawyerListViewController.swift
//  YourLawyer
//
//  Created by mac on ١٨ جما١، ١٤٣٩ هـ.
//  Copyright © ١٤٣٩ هـ mac pro retina. All rights reserved.
//

import UIKit

class LawyerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    //varibles
    let names = ["احمد","عبدالله","ياسر"]
    var filterData = [String]()
    var isSearch = false
    //outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchLawyer: UISearchBar!
    
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        searchLawyer.delegate = self
        super.viewDidLoad()
       
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
            cell.lawerImage.image = UIImage(named: "avatar.png")
            cell.lawerImage.layer.cornerRadius = cell.lawerImage.frame.height / 2
            cell.lawerImage.clipsToBounds = true
            return cell
            
        }else{

        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.lawerName.text = names[indexPath.row]
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
