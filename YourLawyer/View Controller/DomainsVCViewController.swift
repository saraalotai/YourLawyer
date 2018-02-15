//
//  DomainsVCViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/7/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class DomainsVCViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    let legaldomain = ["first","second","third","fourth"]
     @IBOutlet weak var domains: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legaldomain.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = domains.dequeueReusableCell(withIdentifier: "domaincell") as! DisplayDomainsTableViewCell
        cell.title.text = legaldomain[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 60
    }
   
    override func viewDidLoad() {
        domains.delegate = self
        domains.dataSource = self
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
