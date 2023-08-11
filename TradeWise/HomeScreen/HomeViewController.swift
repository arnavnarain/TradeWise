//
//  HomeViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/12/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    let db = Firestore.firestore()
    var currentUser = Auth.auth().currentUser

    var stats: UserStats!
    let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Home"
        
        homeView.labelName.text = currentUser?.displayName
        getStats()
    }
    
    func getStats() {
        db.collection("stats").document((currentUser?.email)!)
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
              guard let data = document.data() else {
                print("Document data was empty.")
                return
              }
              print("Current data: \(data)")
              do{
                  let stats = try document.data(as: UserStats.self)
                  self.stats = stats
                  self.homeView.labelComments.text = "Comments: \(self.stats.num_comments)"
                  self.homeView.labelPoints.text = "Points: \(self.stats.points)"
                  if (self.stats.last_lesson_name.isEmpty) {
                      self.homeView.labelLastLessonName.text = "No lessons viewed yet"
                  } else {
                      self.homeView.labelLastLessonTitle.text = self.stats.last_lesson_title
                      self.homeView.labelLastLessonName.text = self.stats.last_lesson_name
    
                  }
              }catch{
                  print(error)
              }
            }
    }
}
