//
//  ListIssuesViewController.swift
//  YourLawyer
//
//  Created by MAC on 25/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class ListIssuesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    let subjects=["قضية تشهير","قضية تزوير","قضية اختلاس"]
    let statues=["لم يتم قبولها","تم قبولها من محامي","تم قبولها من محامي"]
    let dates=["١٢-٦-٢٠١٨","١٣-٩-٢٠١٨","٥-٨-٢٠١٨"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Issue") as! ListIssueTableViewCell
        cell.cellview.layer.cornerRadius = cell.cellview.frame.height / 2
        cell.subject.text = subjects[indexPath.row]
       cell.status.text = statues[indexPath.row]
        cell.date.text = dates[indexPath.row]
return cell
    }
    

    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var tableview: UITableView!
    
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
