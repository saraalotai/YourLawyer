//
//  MyIssuesViewController.swift
//  YourLawyer
//
//  Created by MAC on 24/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class MyIssuesViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    let subjects=["قضية تشهير" , "قضية اختلاس" , "قضية تزوير"]
    let statuses=["لم يتم قبولها" , "لم يتم قبولها" , "قبلت من المحامي"]
    let dates=["18-9-2018", "13-2-2018" , "15-7-2018"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "MyIssues") as! MyIssuesTableViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.subject.text = subjects[indexPath.row]
        cell.status.text = statuses[indexPath.row]
        cell.date.text = dates[indexPath.row]
        return cell

    }
    
override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
