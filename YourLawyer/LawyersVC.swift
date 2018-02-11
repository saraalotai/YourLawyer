//
//  LawyersVC.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/7/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class LawyersVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    let info = ["الاسم","اسم الشركة","البريد الإلكتوني","المجالات التي يعمل بها "]
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var infotable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infocell = infotable.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
        infocell.title.text = info[indexPath.row]
        return infocell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func viewDidLoad() {
        infotable.delegate = self
        infotable.dataSource = self
        self.image.layer.cornerRadius = image.frame.size.height / 2
        self.image.clipsToBounds = true
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
