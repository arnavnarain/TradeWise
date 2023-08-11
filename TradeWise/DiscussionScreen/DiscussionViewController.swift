//
//  DiscussionViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/24/23.
//

import UIKit

import FirebaseAuth
import FirebaseFirestore

class DiscussionViewController: UIViewController {
    
    let db = Firestore.firestore()
    var currentUser = Auth.auth().currentUser

    var discussion = Discussion(posts: [])
    var discussionID: String!
    
    let discussionView = DiscussionView()
        
    override func loadView() {
        view = discussionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Discussion"
        
        navigationItem.hidesBackButton = false
        
        discussionView.tableViewPosts.delegate = self
        discussionView.tableViewPosts.dataSource = self
        discussionView.tableViewPosts.separatorStyle = .singleLine
        
        getMessages()
        
        discussionView.buttonSend.addTarget(self, action: #selector(onSendTapped), for: .touchUpInside)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        scrollToBottom()
    }
    
    func getMessages() {
        self.db.collection("discussions").document(discussionID)
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
              guard let data = document.data() else {
                print("Document data was empty.")
//                  print(document)
//                  print(document.data())
                return
              }
              print("Current data: \(data)")
                do{
                    let disc = try document.data(as: Discussion.self)
                    self.discussion = disc
                    print("Retrieved Discussion \(disc)\n")
                    self.discussionView.tableViewPosts.reloadData()
//                    self.scrollToBottom()
                }catch{
                    print(error)
                }
                
            }
        
    }
    
    @objc func onSendTapped() {
        // First, we store the users message in the local chat object
        let postText = self.discussionView.textFieldChat.text!
        let post: Post = Post(user: (self.currentUser?.displayName)!, date: Date(), text: postText)
        
        print("Added message locally")
        self.discussion.posts.append(post)
        self.discussionView.tableViewPosts.reloadData()
        self.discussionView.textFieldChat.text = ""
        
        scrollToBottom()
        // Now, lets send it to the backend
        sendPost(post: post)
    }
    
    func scrollToBottom() {
        // Scroll to bottom code: stackoverflow.com/a/29799626

        let numberOfSections = self.discussionView.tableViewPosts.numberOfSections
        let numberOfRows = self.discussionView.tableViewPosts.numberOfRows(inSection: numberOfSections-1)

        if numberOfRows > 0 {
            let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
            self.discussionView.tableViewPosts.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

}
