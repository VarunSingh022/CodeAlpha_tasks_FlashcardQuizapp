//
//  QuizScoreViewController.swift
//  FlashcardQuizapp
//
//  Created by Varun Kumar Singh on 14/07/24.
//

import UIKit
import Foundation


class QuizScoreViewController: UIViewController {
    
    
    
    @IBOutlet weak var scoreLevel: UILabel!
    @IBOutlet weak var totalCorrectLabel: UILabel!
    @IBOutlet weak var totalIncorrectLabel: UILabel!
    
    @IBOutlet weak var incorrectListLabel: UILabel!
    
    var questionList: [String: Any]!
    var roundSet: Int = 0
    var roundNumber: Int = 1
    var correct: [String] = []
    var incorrect: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(
            totalCorrectLabel.text = "Total correct: \(correct.count)")
        
        print(
            totalIncorrectLabel.text = "Total incorrect: \(incorrect.count)")
        
        var percentScore: Double = Double(correct.count) / Double(roundSet) * 100
        var percentValue: Int = Int (round (Double (percentScore)))
        print(
            scoreLevel.text = "Test score: \(percentValue)%" ,
            print(percentScore),
            print(percentValue))
        
        //Set unique values for incorrect List
        var uniqueIncorrect = Array (Set (incorrect) )
        print(
            incorrectListLabel.text = "Study these again: \(uniqueIncorrect.joined (separator:", ")) ")
    }
    
    
    
    
    
    // Do any additional setup after loading the view.
    
    // button for studying again.
    @IBAction func pressedStudyAgain(_ sender: Any) {
        totalCorrectLabel.text = ""
        totalIncorrectLabel.text = ""
        scoreLevel.text = ""
        incorrectListLabel.text = ""
        
    }
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        
        if seque.identifier == "goPrevious" {
            if let destination = seque.destination as? FlashcardViewController {
                destination.roundSet = roundNumber
                destination.questionList = questionList
                destination.roundSet = roundSet
                destination.roundNumber = roundNumber
                
                
            }
        }
        
    }
    
    // button to get back to homepage for new quiz.
    @IBAction func goToHome(_ sender: Any){
        performSegue(withIdentifier: "unwind", sender: self)
        
    }
    
    
    
   
    
    
}
