//
//  ViewController.swift
//  FlashcardQuizapp
//
//  Created by Varun Kumar Singh on 10/07/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //declare variable for user input to set number of test rounds.
    var questionList = [String: Any] ()
    
    //IBOutlets for labels
    
    
    @IBOutlet weak var testRoundsField: UITextField!
    @IBOutlet weak var flashcardQuestionField: UITextField!
    @IBOutlet weak var flashcardAnswerField: UITextField!
    @IBOutlet weak var buttonBeginTest: UIButton!
    @IBOutlet weak var buttonAddFlashcard: UIButton!
    @IBOutlet weak var enterQuizWarning: UILabel!
    @IBOutlet weak var enterRoundsWarning: UILabel!
    
    
    //load the view
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view.
        
        enterRoundsWarning.isHidden = true
        
        startOver()
        
        setupFieldsNotEmpty()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    lazy var roundNumber = Int(testRoundsField.text!)!
    
    func startOver() {
        questionList.removeAll()
        testRoundsField.text = ""
        enterQuizWarning.isHidden = false
        print(questionList)
    }
    
    func setupFieldsNotEmpty() {
        if testRoundsField.text != "" && questionList.count > 0 {
            buttonBeginTest.isHidden = false
        } else {
            buttonBeginTest.isHidden = true
        }
    }
    //IBActions for buttons
    //Add key value pairsfrom user input into vocablist Dictionary
    @IBAction func addQuestionButton(_ sender: Any) {
        questionList.updateValue(flashcardAnswerField.text!, forKey: flashcardQuestionField.text!)
        
        flashcardQuestionField.text = ""
        flashcardAnswerField.text = ""
        setupFieldsNotEmpty()
        
        if questionList.count > 0 {
            enterQuizWarning.isHidden = true
        }
        
        if testRoundsField.text == "" {
            enterRoundsWarning.isHidden = false
        }else {
            enterRoundsWarning.isHidden = true
        }
    }
    
    // Move into next screen.
    @IBAction func beginTestButton(_ sender: Any) {
    }
    
    // Seque to FlashcardViewController.
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        
        if seque.identifier == "openFlashcard" {
            if let destination = seque.destination as? FlashcardViewController {
                destination.roundSet = roundNumber
                destination.questionList = questionList
                destination.questionList = questionList
            }
        }
        
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    
}
