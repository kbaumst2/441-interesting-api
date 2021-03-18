//
//  ViewController.swift
//  interesting-api
//
//  Created by Kate Baumstein on 3/15/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let questions = [
        0 : ("What is your body’s largest organ?" , "Skin"),
        1 : ("How many soccer players should each team have on the field at the start of each match?", "11"   ),
        2 : ("What year was the very first model of the iPhone released?", "2007"),
        3 : ("What does “HTTP” stand for?", "HyperText Transfer Protocol"),
        4 : ("What is the symbol for potassium?", "K"),
        5 : ("Which natural disaster is measured with a Richter scale?", "Earthquakes"),
        6 : ("Which animal can be seen on the Porsche logo?" , "Horse"),
        7 : ("What’s the primary ingredient in hummus?" , "Chickpeas" ),
        8 : ("Which country invented tea?" , "China" ) ,
        9 : ("What is the national dish of Spain?" , "Paella"),
        ]
    
    var questionsUsed  : [Int] = []
    var currentQuestion : String = "What is your body’s largest organ?"
    var currentAnswer : String = "Skin"
    @IBOutlet var textField : UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel : UILabel!
    @IBOutlet var resultLabel: UILabel!
    var synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentQuestion =
//        currentAnswer =
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitAnswer(sender: UIButton){
        print("TEXT: " + (textField.text ?? ""))
        let utterance = AVSpeechUtterance(string: "Your answer was: " + (textField.text ?? ""))
       // synthesizer = AVSpeechSynthesizer()
        //utterance.rate = 0.2
 //       dialogue.voice = AVSpeechSynthesisVoice(language: "en-gb")
        utterance.voice = AVSpeechSynthesisVoice(language: "el-GB")
 //       print(AVSpeechSynthesisVoice.speechVoices())
   //     utterance.voice?.gender = AVSpeechSynthesisVoiceGender.female
        synthesizer.speak(utterance)
        answerLabel.text = "Correct answer: " + currentAnswer
        
        if(currentAnswer.lowercased() == textField.text?.lowercased() ){
            resultLabel.text = "Correct!"
        }
        else{
            resultLabel.text = "Incorrect!"
        }
        
        
    }
    
    @IBAction func getNewQuestion(sender: UIButton){
        let questionId = getQuestion()
        let question = questions[questionId]?.0
        currentQuestion = question!
        let answer = questions[questionId]?.1
        currentAnswer = answer!

        questionLabel.text = "Question: " + currentQuestion
        
    }
    
    
    
    func getQuestion() -> Int{
        var q : Int = 0
        if questionsUsed.count == questions.count {
            questionsUsed.removeAll()
        }
      //  var index = 0
        for i in  0...questions.count-1 {
            if(!questionsUsed.contains(i)){
                q = i            }
            //index += 1
        }
        
        return q
        
    
    }
    
    
            
    
    
    


}

