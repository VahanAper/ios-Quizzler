//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let questions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionIndex: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = questions.list[0]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        // 1 is true, 2 is false
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionIndex += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionIndex <= 12 {
            questionLabel.text = questions.list[questionIndex].questionText
        } else {
            let alert = UIAlertController(
                title: "Awesome",
                message: "Do you want to start over?",
                preferredStyle: .alert
            )
            
            let restartAction = UIAlertAction(
                title: "Restart",
                style: .default,
                handler: { (UIAlertAction) in
                    self.startOver()
                }
            )
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = questions.list[questionIndex].answer
        
        if correctAnswer == pickedAnswer {
            print("right")
        } else {
            print("wrong")
        }
    }
    
    
    func startOver() {
        questionIndex = 0
        
        nextQuestion()
    }
    

    
}
