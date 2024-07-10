//
//  FlashcardViewController.swift
//  FlashcardQuizapp
//
//  Created by Varun Kumar Singh on 10/07/24.
//

import Foundation
import UIKit

class FlashcardViewController: UIViewController {
    
    var questionList: [String: Any]!
    var roundSet: Int = 0
    var roundNumber: Int = 1
    var correct: [String] = []
    var incorrect: [String] = []
    
    
    
    //IBOutlets
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var roundLevel: UILabel!
    @IBOutlet weak var buttonIncorrectshow: UIButton!
    @IBOutlet weak var buttonCorrectShow: UIButton!
    @IBOutlet weak var showAnswerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(questionList!)
        placeholderLabel.text = questionList?.randomElement()?.key
        
        updateUI()
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        showAnswerLabel.text = (questionList[placeholderLabel.text!] as! String)
    }
    
    
    @IBAction func pressedIncorrect(_ sender: Any) {
        incorrectPressed()
        incorrect.append(placeholderLabel.text!)
        showAnswerLabel.text = ""
        print(incorrect)
        nextFlashcard()
    }
    
    @IBAction func pressedCorrect(_ sender: Any) {
        correctPressed()
        correct.append(placeholderLabel.text!)
        showAnswerLabel.text = ""
        nextFlashcard()
    }
    
    func updateScoreTable() {
        
        //Calculate score var percentScore:
        var percentScore: Double = Double(correct.count) / Double(roundSet) * 100
        var percentValue: Int = Int (round (Double (percentScore)))
        print (percentScore)
        print (percentValue)
    }
        
    func correctPressed() {
            roundNumber += 1
            nextFlashcard()
        }
        
    func incorrectPressed() {
            roundNumber += 1
            nextFlashcard()
        }
        
    func updateUI() {
            roundLevel.text = "Round \(roundNumber) of \(roundSet as Int)"
        }
        
    func nextFlashcard() {
            if roundNumber <= roundSet {
                placeholderLabel.text = questionList?.randomElement()?.key
                updateUI()
            }
        else {
            buttonIncorrectshow.isHidden = true
            buttonCorrectShow.isHidden = true
        }
        }
        
        // see scorecard on next screen.
        @IBAction func ShowScoreButton(_ sender: Any) {
        }
        
        //Seque to FlashcardViewController
        override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
            
            if seque.identifier == "quizscoreCard" {
                if let destination = seque.destination as? QuizScoreViewController {
                    destination.correct = correct
                    destination.incorrect = incorrect
                    destination.correct.count
                    destination.incorrect.count
                    destination.roundSet = roundSet
                    destination.questionList = questionList
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    

