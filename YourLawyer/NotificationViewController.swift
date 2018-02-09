//
//  NotificationViewController.swift
//  YourLawyer
//
//  Created by MAC on 23/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    let notifis = [" المحامي فهد قام بإرسال استشارة إلى قضيتك ", "المحامي خالد قام بإرسال سؤال"]
    
    @IBOutlet weak var notifiTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifis.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let str = notifiTable.dequeueReusableCell(withIdentifier: "notifiCel") as! CustomTableView
        str.cellView.layer.cornerRadius = str.cellView.frame.height / 2
        str.notifi.text = notifis[indexPath.row]
        
        return str
    }
    

    override func viewDidLoad() {
        notifiTable.delegate = self
        notifiTable.dataSource = self
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
