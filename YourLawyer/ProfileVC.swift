//
//  ProfileVC.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/8/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var image: UIImageView!
    let str = ["معلومات الحساب","اسم المحامي الكامل" , "البريد الإلكتروني" , "رقم الجوال"]
   
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "تعديل", style: .plain, target: self, action: #selector(getter: edit))
        self.image.layer.cornerRadius = self.image.frame.size.height / 2
self.image.clipsToBounds = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return str.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! ProfileDataTableViewCell
        cell.title.text = str[indexPath.row]
        
          return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
