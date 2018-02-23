//
//  staticProfileTableViewController.swift
//  YourLawyer
//
//  Created by MAC on 06/06/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class staticProfileTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var imagePacker:UIImagePickerController!
    var imagepath = ""
    var UserUID:String?

    
    @IBAction func changeImage(_ sender: Any) {
        print("اختر صورة")
        present(imagePacker, animated: true, completion: nil)
    }

    
    
    
    @IBOutlet weak var lawyerName: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var officeName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePacker = UIImagePickerController()
        imagePacker.delegate = self
        
        self.profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        self.profileImage.clipsToBounds = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            profileImage.image = image
            //upload image
            let storageRef = Storage.storage().reference(forURL:"gs://mylawyer-f867a.appspot.com")
            var data = NSData()
            data = UIImageJPEGRepresentation(image , 0.8)! as NSData
            let dataFormat = DateFormatter()
            dataFormat.dateFormat = "MM_DD_yy_hh_mm_a"
            let imageName = "\(self.UserUID ?? "11")_\(dataFormat.string(from: NSDate() as Date))"
            imagepath = "profileImages/\(imageName).jpg"
            let childUserImages = storageRef.child(imagepath)
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            childUserImages.putData(data as Data, metadata: metaData)
            //save to database
            
            let downloadedImage = metaData.downloadURL()
            print(downloadedImage)
            
        imagePacker.dismiss(animated: true, completion: nil)
        
       

    }
    
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
       let userID = Auth.auth().currentUser!.uid
        let userRef = Database.database().reference().child("users/\(userID)")
        
        userRef.observe(.value, with: { (snapshot) in
            print ("no print")
            
            let user = profileDetails(snapshot: snapshot)
            
            self.lawyerName.text = user.fullName
            self.phoneNo.text = user.phoneNo
            self.officeName.text = user.officeName
            
                    
            
        })
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }


}
