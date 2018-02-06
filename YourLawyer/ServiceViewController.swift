//
//  ServiceViewController.swift
//  YourLawyer
//
//  Created by MAC on 20/05/1439 AH.
//  Copyright © 1439 mac pro retina. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        mainButton.layer.cornerRadius = mainButton.frame.height / 2
        secondButton.layer.cornerRadius = secondButton.frame.height / 2
        thirdButton.layer.cornerRadius = thirdButton.frame.height / 2
        fourthButton.layer.cornerRadius = fourthButton.frame.height / 2
        fifthButton.layer.cornerRadius = fifthButton.frame.height / 2
        sixButton.layer.cornerRadius = sixButton.frame.height / 2
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
