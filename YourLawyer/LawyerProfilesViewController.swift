//
//  LawyerProfilesViewController.swift
//  YourLawyer
//
//  Created by MAC on 20/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class LawyerProfilesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var edit: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!

     let str = ["معلومات الحساب","اسم المحامي الكامل" , "البريد الإلكتروني" , "رقم الجوال"]
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellT") as! DataTableViewCell
        
      cell.title.text = str[indexPath.row]
        
        return cell
    }
    
   
    
    
    override func viewDidLoad() {
        
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "تعديل", style: .plain, target: self, action: #selector(getter: edit))
        
    
        
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
