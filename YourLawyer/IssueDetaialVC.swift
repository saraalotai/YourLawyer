//
//  IssueDetaialVC.swift
//  YourLawyer
//
//  Created by MAC on 24/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class IssueDetaialVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var tableview: UITableView!
    
    let issues = ["مجال القضية ", "اسم مقدم القضية " , "حالة القضية " , "ملخص القضية " ]
    
    let str = ["قضايا التشهير " , "معلقة " , "محمد صالح " , "قضية تشهير من قبل أحد المتعرضين"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "issueD") as! IssueTableViewCell
        cell.title.text = issues[indexPath.row]
        cell.subtitle.text = str[indexPath.row]

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
