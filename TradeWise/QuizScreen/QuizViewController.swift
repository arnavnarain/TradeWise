//
//  QuizViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/25/23.
//

import UIKit

import FirebaseAuth
import FirebaseFirestore

class QuizViewController: UIViewController {
    
    let db = Firestore.firestore()
    var currentUser = Auth.auth().currentUser

    var quiz: Quiz!
    let quizView = QuizView()
        
    override func loadView() {
        view = quizView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Knowledge Check"
        
        navigationItem.hidesBackButton = false
        
        quizView.labelQuestion.text = quiz.question
        quizView.buttonAnswer1.setTitle(quiz.answer1, for: .normal)
        quizView.buttonAnswer2.setTitle(quiz.answer2, for: .normal)
        quizView.buttonAnswer3.setTitle(quiz.answer3, for: .normal)

        quizView.buttonAnswer1.addTarget(self, action: #selector(handleAnswer1), for: .touchUpInside)
        quizView.buttonAnswer2.addTarget(self, action: #selector(handleAnswer2), for: .touchUpInside)
        quizView.buttonAnswer3.addTarget(self, action: #selector(handleAnswer3), for: .touchUpInside)
    }
    
    @objc func handleAnswer1() {
        handleAnswer(answerIdx: 1)
    }
    
    @objc func handleAnswer2() {
        handleAnswer(answerIdx: 2)
    }
    
    @objc func handleAnswer3() {
        handleAnswer(answerIdx: 3)
    }
    
    func handleAnswer(answerIdx: Int) {
        quizView.buttonAnswer1.isEnabled = false
        quizView.buttonAnswer2.isEnabled = false
        quizView.buttonAnswer3.isEnabled = false
        
        switch quiz.correctAnswerIdx {
        case 1:
            quizView.buttonAnswer1.backgroundColor = .green
            
            quizView.buttonAnswer2.backgroundColor = .red
            quizView.buttonAnswer2.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
            
            quizView.buttonAnswer3.backgroundColor = .red
            quizView.buttonAnswer3.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        case 2:
            quizView.buttonAnswer1.backgroundColor = .red
            quizView.buttonAnswer1.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
            
            quizView.buttonAnswer2.backgroundColor = .green
            
            quizView.buttonAnswer3.backgroundColor = .red
            quizView.buttonAnswer3.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        case 3:
            quizView.buttonAnswer1.backgroundColor = .red
            quizView.buttonAnswer1.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)

            quizView.buttonAnswer2.backgroundColor = .red
            quizView.buttonAnswer2.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)

            quizView.buttonAnswer3.backgroundColor = .green
        default:
            print("Impossible to get here!")
        }
        
        checkAnswer(answerIdx: answerIdx)
    }
    
    func checkAnswer(answerIdx: Int) {
        if (self.quiz.correctAnswerIdx == answerIdx) {
            self.quizView.labelResult.text = "You got it! :)"
            addPoints()
        } else {
            self.quizView.labelResult.text = "Incorrect :("
        }
    }
    
    func addPoints() {
        db.collection("stats").document((currentUser?.email)!)
            .updateData(["points": FieldValue.increment(Int64(100))])
    }

}
