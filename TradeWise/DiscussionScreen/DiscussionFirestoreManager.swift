//
//  DiscussionFirestoreManager.swift
//  TradeWise
//
//  Created by user233615 on 6/24/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

extension DiscussionViewController {
    func sendPost(post: Post){
        print("Sending post")
        let discussionDocument = db.collection("discussions").document(self.discussionID)
        do {
            print("Discussion document recieved, updating posts array\n")
            print("This is what we're sending over: \(self.discussion.posts)\n")
            let encodedPost = try [post].map { try Firestore.Encoder().encode($0) }

            discussionDocument.updateData(["posts" : FieldValue.arrayUnion(encodedPost)])
            updateStats()
        } catch {
            print("Unable to send post!")
        }
        
        self.discussionView.tableViewPosts.reloadData()
        print("Post sent succesfully!")
    }
    
    func updateStats() {
        db.collection("stats").document((currentUser?.email)!)
            .updateData(["num_comments": FieldValue.increment(Int64(1))])
    }
}
