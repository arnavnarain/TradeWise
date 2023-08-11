//
//  LessonsViewController.swift
//  TradeWise
//
//  Created by user239353 on 6/24/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class LessonsViewController: UIViewController {
    
    let db = Firestore.firestore()
    var currentUser = Auth.auth().currentUser
    
    var moduleName: String!
    let lessonsView = LessonsView()
    var lessons = [Lesson]()
    var moduleIndex: Int!
    
    var quiz: Quiz!
    
    override func loadView() {
        view = lessonsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel()
        titleLabel.text = "\(moduleName ?? "Module") Lessons"
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize)
        
        // Add the custom label as the title view of the navigation item
        navigationItem.titleView = titleLabel
        
        
        
        lessonsView.tableViewLessons.delegate = self
        lessonsView.tableViewLessons.dataSource = self
        lessonsView.tableViewLessons.separatorStyle = .none
        
        loadLessons()
        
        lessonsView.tableViewLessons.reloadData()
        
        lessonsView.buttonViewDiscussion.addTarget(self, action: #selector(onViewDiscTapped), for: .touchUpInside)
        
        lessonsView.buttonQuiz.addTarget(self, action: #selector(onQuizTapped), for: .touchUpInside)
        
        
    }
    
    @objc func onQuizTapped() {
        let quizView = QuizViewController()
        quizView.quiz = quiz
        
        navigationController?.pushViewController(quizView, animated: true)
    }
    
    @objc func onViewDiscTapped() {
        let discView = DiscussionViewController()
        
        let moduleNumber = "module\(moduleIndex ?? 1)"
        discView.discussionID = moduleNumber
        
        navigationController?.pushViewController(discView, animated: true)
    }
    
    func loadLessons() {
        let moduleNumber = "module\(moduleIndex ?? 1)"
        print(moduleNumber)
        let modulesRef = db.collection("lessons").document(moduleNumber).collection("lessons")
        modulesRef.addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    do {
                        let mod = try document.data(as: Lesson.self)
                        print("Retrieved module: \(mod)")
                        self.lessons.append(mod)
                        self.lessonsView.tableViewLessons.reloadData()

                    }
                    catch {
                        print("Error!!!")
                        print(error)
                    }
                }
                self.lessonsView.tableViewLessons.reloadData()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
