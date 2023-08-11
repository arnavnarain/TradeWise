//
//  ProfileViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/13/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfileViewController: UIViewController {

    let notificationCenter = NotificationCenter.default
    
    let profileView = ProfileView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    var displayName: String = ""
    
    var lessonHistory: [String] = []
    
    let db = Firestore.firestore()
    var stats: UserStats!
    
    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Your Profile"
        setupLogoutButton()
        
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user != nil {
                self.currentUser = user
                self.displayName = user?.displayName ?? ""
                self.profileView.labelText.text = "\(self.displayName ?? "Anonymous")"
                
                if let url = self.currentUser?.photoURL{
                    self.profileView.profilePic.loadRemoteImage(from: url)
                }
                self.getLessons()
                self.getStats()
            }
            
            // Do any additional setup after loading the view.
        }
    }
    
    func getLessons() {
        do {
            try db.collection("history").document(self.displayName).addSnapshotListener {(snapshot, error) in
                if let error = error {
                    print("Error")
                    return
                }
                
                if let snapshot = snapshot {
                    if let data = snapshot.data() {
                        
                        if var history = data["history"] as? [String] {
                            self.lessonHistory = history
                            
                        }
                        
                        var count = 0
                        
                        let lessonString = self.lessonHistory.enumerated().map {(index, str) in
                            return "\(index + 1). \(str)"
                        }.joined(separator: "\n")
                        self.profileView.lessonsLabel.text = lessonString
                        print(lessonString)
                        print("TEST")
                    }
                }
            }
        }
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
                  self.profileView.labelPoints.text = "Points: \(self.stats.points)"
                  self.profileView.labelComments.text = "Comments: \(self.stats.num_comments)"
              }catch{
                  print(error)
              }
            }
    }
    
    func setupLogoutButton() {
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
            style: .plain,
            target: self,
            action: #selector(onLogOutBarButtonTapped))
        navigationItem.rightBarButtonItem = barIcon
    }
    
    @objc func onLogOutBarButtonTapped() {
        do {
            try Auth.auth().signOut()
//            self.tabBarController?.dismiss(animated: true)
            notificationCenter.post(name: .logoutNotification, object: nil)
            //TODO: Redirect User to the Login/Signup Page
        } catch {
            print("Error occured")
        }
    }

}
