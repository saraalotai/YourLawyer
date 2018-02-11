//
//  RegisterLawyerViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/11/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
class RegisterLawyerViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var IDTF: UITextField!
    @IBOutlet weak var legalDoTF: UITextField!
    @IBOutlet weak var oficenameTF: UITextField!
    @IBOutlet weak var cardNOTF: UITextField!
    @IBOutlet weak var genderDD: UIPickerView!
    @IBOutlet weak var cardimg: UIImageView!
  
    var imagePacker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePacker = UIImagePickerController()
        imagePacker.delegate = self

        // Do any additional setup after loading the view.
    }


    @IBAction func cardButton(_ sender: Any) {
        print("اختر صورة")
        present(imagePacker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
           cardimg.image = image
        }
    }
    @IBAction func regButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTF.text! , password: passwordTF.text!) { (user, error) in
            if let error = error{
            print(error)
                
            }else{
                print("User ID: \(user?.uid)")
            }
        }
        
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
