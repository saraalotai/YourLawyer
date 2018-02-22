//
//  IssueViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/5/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class IssueViewController: UIViewController ,AVAudioRecorderDelegate, AVAudioPlayerDelegate, UIPickerViewDataSource ,UIPickerViewDelegate ,UITextFieldDelegate ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    var audioplayer = AVAudioPlayer()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    ////////
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    var path: URL!
    ////////

    ///////////
    @IBOutlet weak var issueType: UITextField!
    
    @IBOutlet weak var lawyer: UITextField!
    
    @IBOutlet weak var dropIssue: UIPickerView!
    
    @IBOutlet weak var dropLawyer: UIPickerView!
    
    var issue = ["جرائم الكترونيه" , "قضايا مدنية"]
    
    var lawyers = ["احمد","سعد"]
    
    var imagePacker:UIImagePickerController!
    
    
    @IBOutlet weak var imageofdoc: UIImageView!
    @IBAction func docPic(_ sender: Any) {
        print("اختر صورة")
        present(imagePacker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let UserUID = Auth.auth().currentUser!.uid

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
           imageofdoc.image = image
            //upload image
            let storageRef = Storage.storage().reference(forURL:"gs://mylawyer-f867a.appspot.com")
            var data = NSData()
            data = UIImageJPEGRepresentation(image , 0.8)! as NSData
            let dataFormat = DateFormatter()
            dataFormat.dateFormat = "MM_DD_yy_hh_mm_a"
       //     let imageName = "\(self.UserUID!)_\(dataFormat.string(from: NSDate() as Date))"
         //   imagepath = "documentsimages/\(imageName).jpg"
         //   let childUserImages = storageRef.child(imagepath)
     //       let metaData = StorageMetadata()
       //     metaData.contentType = "image/jpeg"
        //    childUserImages.putData(data as Data, metadata: metaData)
            //save to database
            
        }
        imagePacker.dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countraws : Int = issue.count
        if pickerView == dropLawyer {
            countraws = self.lawyers.count
            
        }
        return countraws

    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if pickerView == dropIssue{
            let  titleRow = issue[row]
            return titleRow
        }
        else if pickerView == dropLawyer {
            let titleRow = lawyers[row]
            return titleRow
        }
       return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dropIssue{
            self.issueType.text = issue[row]
            self.dropIssue.isHidden = true
            
        }
        else if pickerView == dropLawyer{
            self.lawyer.text = lawyers[row]
            self.dropLawyer.isHidden = true
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.issueType){
         self.dropIssue.isHidden = false
            
        }
        else if (textField == self.lawyer){
            self.dropLawyer.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePacker=UIImagePickerController()
        imagePacker.delegate=self
        //
        ////////////////
        playButton.isEnabled = false
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.recordButton.setTitle("تسجيل", for: .normal)
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
////////////////////////////////////////////////
        // Do any additional setup after loading the view.
    }
    ///////////////////////////
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a") //1
        path = audioFilename
        playButton.isEnabled = false
        
        let settings = [ //2
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings) //3
            audioRecorder.delegate = self
            audioRecorder.record() //3
            
            recordButton.setTitle("ايقاف التسجيل", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    ///////////////////////////////////////////////
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    /////////////////////////////////////////////////////
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        playButton.isEnabled = true
        
        if success {
            recordButton.setTitle("اعادة التسجيل", for: .normal)
        } else {
            recordButton.setTitle("تسجيل", for: .normal)
            // recording failed :(
        }
    }
    ///////////////////////////////////////////////////
    @IBAction func play(_ sender: Any) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    ///////////////////////////////////////////////////

    @IBAction func Restart(_ sender: Any) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: path)
                audioPlayer?.delegate = self
                audioPlayer?.play()
                recordButton.isEnabled = false
            } catch {
                // couldn't load file :(
            }
    }
    /////////////////////////////////////////////////
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    /////////////////////////////////////////////////
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordButton.isEnabled = true
    }
    /////////////////////////////////////////////////////
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
