//
//  TextScreenViewController.swift
//  TradeWise
//
//  Created by user239353 on 6/24/23.
//
import UIKit
import FirebaseFirestore
import FirebaseAuth

class TextScreenViewController: UIViewController {
    
    var lesson: Lesson!
    var textScreenView = TextScreenView()
    var checkboxButton: UIButton!
    var userName: String!
    
    let db = Firestore.firestore()
    
    override func loadView() {
        view = textScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener{ auth, user in
            if user != nil {
                self.userName = user?.displayName ?? ""
                self.setupCheckbox()
            } else {
                self.userName = ""
            }
        }
        
        textScreenView.authorName.text = "by \(lesson.author)"
        
        let df = DateFormatter()
//        df.locale = Locale(identifier: "en_US")
        df.dateFormat = "MMMM d, YYYY"
        let date_str = df.string(from: lesson.date)
        print("Date = \(date_str)")
        textScreenView.date.text = "Published: \(date_str)"
        textScreenView.title.text = lesson.title
        textScreenView.name.text = lesson.name
        textScreenView.text.text = lesson.text
        print(textScreenView.text.text)
        
    }
    
    func findInitialState(barIcon: UIBarButtonItem) {
        do {
            try db.collection("history").document(userName).getDocument {(snapshot, error) in
                if let error = error {
                    print("Error")
                    return
                }
                
                if let snapshot = snapshot {
                    if let data = snapshot.data() {
                        
                        if var history = data["history"] as? [String] {
                            if history.contains(self.lesson.name) {
                                barIcon.isSelected = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    func setupCheckbox() {
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "checkmark.square"),
            style: .plain,
            target: self,
            action: #selector(checkboxTapped)
        )
        let barText = UIBarButtonItem(
            title: "Complete Lesson",
            style: .plain,
            target: nil,
            action: nil
        )
        findInitialState(barIcon: barIcon)
        navigationItem.rightBarButtonItems = [barIcon, barText]
    }
    
    @objc func checkboxTapped(_ sender: UIButton) {
        
        if sender.isSelected {
            do {
                try db.collection("history").document(userName).getDocument {(snapshot, error) in
                    if let error = error {
                        print("Error")
                        return
                    }

                    if let snapshot = snapshot {
                        if let data = snapshot.data() {

                            if var history = data["history"] as? [String] {
                                history = history.filter { $0 != self.lesson.name}

                                let docRef = self.db.collection("history").document(self.userName)
                                
                                docRef.updateData([
                                    "history": history
                                ])
                            }
                        }
                    }
                    
                }
            }
        } else {
            // Complete the task
            do {
                try db.collection("history").document(userName).getDocument {(snapshot, error) in
                    if let error = error {
                        print("Error")
                        return
                    }

                    if let snapshot = snapshot {
                        if let data = snapshot.data() {

                            if var history = data["history"] as? [String] {
                                history.append(self.lesson.name)
                                print(history)
                                
                                let docRef = self.db.collection("history").document(self.userName)
                                
                                docRef.updateData([
                                    "history": history
                                ])
                            }
                        }
                    }
                    
                }
            }
        }
        sender.isSelected = !sender.isSelected
    }
}
