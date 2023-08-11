//
//  Discussion.swift
//  TradeWise
//
//  Created by user233615 on 6/24/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Discussion: Codable {
    @DocumentID var id: String?
    var posts: [Post]
}

struct Post: Codable {
    var user: String
    var date: Date
    var text: String
}
