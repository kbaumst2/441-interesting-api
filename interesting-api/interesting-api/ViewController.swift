//
//  ViewController.swift
//  interesting-api
//
//  Created by Kate Baumstein on 3/15/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var textField : UITextField!
    @IBOutlet var button: UIButton!
    var synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitAnswer(sender: UIButton){
        print("TEXT: " + (textField.text ?? ""))
        let utterance = AVSpeechUtterance(string: textField.text ?? "")
       // synthesizer = AVSpeechSynthesizer()
        //utterance.rate = 0.2
 //       dialogue.voice = AVSpeechSynthesisVoice(language: "en-gb")
        utterance.voice = AVSpeechSynthesisVoice(language: "el-GB")
 //       print(AVSpeechSynthesisVoice.speechVoices())
   //     utterance.voice?.gender = AVSpeechSynthesisVoiceGender.female
        synthesizer.speak(utterance)
        
    }


}

