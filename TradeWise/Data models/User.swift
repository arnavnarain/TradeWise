//
//  User.swift
//  TradeWise
//
//  Created by user239353 on 6/13/23.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

struct UserStats: Codable {
    @DocumentID var id: String?
    var num_comments: Int
    var points: Int
    var last_lesson_title: String
    var last_lesson_name: String

}
