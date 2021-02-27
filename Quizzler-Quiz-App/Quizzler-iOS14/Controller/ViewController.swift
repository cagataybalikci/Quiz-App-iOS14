//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceOne : UIButton!
    @IBOutlet weak var choiceTwo : UIButton!
    @IBOutlet weak var choiceThree : UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func updateChoices(){
        let choices = quizBrain.getChoices()
        choiceOne.setTitle(choices[0], for: .normal)
        choiceTwo.setTitle(choices[1], for: .normal)
        choiceThree.setTitle(choices[2], for: .normal)
    }
    
    @objc func updateUI(){
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
        updateChoices()
    }
    
}

