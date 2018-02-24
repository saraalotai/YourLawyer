//
//  IssueViewController.swift
//  YourLawyer
//
//  Created by mac pro retina on 2/5/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import AVFoundation
import FirebaseMessaging
class IssueViewController: UIViewController , AVAudioRecorderDelegate, AVAudioPlayerDelegate{
   
    ////////
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    var path: URL!
    //////////////
  

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

    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePacker=UIImagePickerController()
       // imagePacker.delegate=self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        //////////////////
      //  playButton.isEnabled = false
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
        }        /////////////////

        // Do any additional setup after loading the view.
    }
/////////////////////
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
           let audioFilerUrl = getAudiFileURL()
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings) //3
            audioRecorder.delegate = self
            audioRecorder.record()
             playButton.isEnabled = false
            recordButton.setTitle("ايقاف التسجيل", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    ////////////////////
    func handleAudioSendWith(url: String) {
        guard let fileUrl = URL(string: url) else {
            return
        }
        let fileName = NSUUID().uuidString + ".m4a"
        
        Storage.storage().reference().child("message_voice").child(fileName).putFile(from: fileUrl, metadata: nil) { (metadata, error) in
            if error != nil {
                print(error ?? "error")
            }
            
            if let downloadUrl = metadata?.downloadURL()?.absoluteString {
                print(downloadUrl)
                let values: [String : Any] = ["audioUrl": downloadUrl]
                
            }
        }
    }
    /////////////////
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    /////////////////////
    func getAudiFileURL() ->URL
    {
        return getDocumentsDirectory().appendingPathComponent(".m4a")
    }
    /////////////////////
   // func handleAudioPLay(){
       // if let audioUrl = message?.audioUrl,let
       // if  let url = URL(String : audioUrl) {
            //do{
              //  try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
              //  audioPlayer = try AVAudioPlayer(contents: url)
              //  audioPlayer?.delegate = self
               // audioPlayer?.prepareToPlay()
              //  audioPlayer?.play()
              //  print("ready to play")
            //}catch{
               // print(error.localizedDescription)
            //}
           // }
   // }
    
    ////////////////////
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
    ////////////////////
    
    @IBAction func recordTapped(_ sender: Any) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
        
    }
    
    @IBAction func playTapped(_ sender: Any) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            recordButton.isEnabled = false
        } catch {
            // couldn't load file :(
        }
    }
    ///////////////////
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

