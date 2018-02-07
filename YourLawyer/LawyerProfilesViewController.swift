//
//  LawyerProfilesViewController.swift
//  YourLawyer
//
//  Created by MAC on 20/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class LawyerProfilesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    @IBOutlet weak var profileL: UIImageView!
    @IBOutlet weak var edit: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!

     let str = ["معلومات الحساب","اسم المحامي الكامل" , "البريد الإلكتروني" , "رقم الجوال"]
   
    override func viewDidLoad() {
        
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "تعديل", style: .plain, target: self, action: #selector(getter: edit))
        

        
        // Do any additional setup after loading the view.
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileL.image = selectedImage
        
        dismiss(animated: true, completion: nil)
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let controller = UIImagePickerController()
        controller.delegate=self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! DataTableViewCell
        
      cell.title.text = str[indexPath.row]
        
        return cell
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
