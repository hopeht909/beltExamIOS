//
//  ViewController.swift
//  ameera
//
//  Created by admin on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlet for Labels
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Outlet for Buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    //Varibale
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    let allQuestions = Quizdata()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI(scoreString: "Score: ")
    }
    //One action for the 4 buttons to check if the answer is right or not
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer{
            score += 1
            if let buttonTitle = sender.title(for: .normal) {
                let scoreString = "\(buttonTitle) Correct Score: \(score) "
                updateUI(scoreString: scoreString)
                
            }
            
            
        }else{
            let scoreString = "Not Quite Score: \(score) "
            updateUI(scoreString: scoreString)
            
        }
        questionNumber += 1
        updateQuestion()
        
        
    }
    //Update the question label and the buttons with new Values in each call
    func updateQuestion(){
        
        if questionNumber <=  allQuestions.data.count - 1{
            questionLabel.text = allQuestions.data[questionNumber].questionString
            optionA.setTitle(allQuestions.data[questionNumber].answerA, for: .normal)
            optionB.setTitle(allQuestions.data[questionNumber].answerB, for: .normal)
            optionC.setTitle(allQuestions.data[questionNumber].answerC, for: .normal)
            optionD.setTitle(allQuestions.data[questionNumber].answerD, for: .normal)
            selectedAnswer = allQuestions.data[questionNumber].correctAnswer
            
            //Alert dialog to show the final score + restart the game
        }else {
            let alert = UIAlertController(title: "Awesome your final score is \(score)", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    //Function to update the score label and the progress view after each answer
    func updateUI(scoreString: String){
        scoreLabel.text = scoreString
        questionCounter.text = "\(questionNumber + 1) / \(allQuestions.data.count)"
        
    }
    //Function to restart the quiz
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        updateUI(scoreString: "Score: ")
        
    }
    //A struct that contain the quseions and the answers
    struct Quizdata{
        var data = [
            Dataset(questionString: "who was one of the creators of the swift language?",
                    correctAnswer: 1,
                    answerA: "Steve Jobs" ,
                    answerB: "Chris lattner",
                    answerC: "steve wozniak",
                    answerD: "Ronald Wayne"),
            
            Dataset(questionString: "Apple was created in what year?",
                    correctAnswer: 0,
                    answerA: "1976" ,
                    answerB: "1989",
                    answerC: "1990",
                    answerD: "2002"),
            
            Dataset(questionString: "The first iphone was relesed on what day?",
                    correctAnswer: 0,
                    answerA: "June 2007" ,
                    answerB: "October 2010",
                    answerC: "May 2011",
                    answerD: "June 2011"),
            Dataset(questionString: "The current iphone has 6GB RAM, The first iphone has how much?",
                    correctAnswer: 2,
                    answerA: "1 GB" ,
                    answerB: "3 GB",
                    answerC: "128 MB",
                    answerD: "it has no ram"),
            Dataset(questionString: "When was Objective-C Created?",
                    correctAnswer: 3,
                    answerA: "1961" ,
                    answerB: "1976",
                    answerC: "1980",
                    answerD: "1984")
            
        ]
    }
    
    struct Dataset {
        var questionString = String()
        var correctAnswer = Int()
        var answerA = String()
        var answerB = String()
        var answerC = String()
        var answerD = String()
        
    }
    struct quizBank{
        static var quizzes = [Quizdata]()
    }
}

