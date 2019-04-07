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
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
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
        scoreLabel.text = "Score: \(score)";
        progressLabel.text = "\(questionIndex + 1) / \(questions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionIndex + 1)
    }
    

    func nextQuestion() {
        if questionIndex <= 12 {
            questionLabel.text = questions.list[questionIndex].questionText
            
            updateUI()
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
            score += 2
        } else {
            score -= 1
        }
        
        updateUI()
    }
    
    
    func startOver() {
        questionIndex = 0
        score = 0
        
        nextQuestion()
    }
    

    
}
