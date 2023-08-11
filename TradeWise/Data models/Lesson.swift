//
//  Module.swift
//  TradeWise
//
//  Created by user233615 on 6/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Lesson: Codable {
    @DocumentID var id: String?
    var author: String
    var date: Date
    var title: String
    var name: String
    var text: String
    
    init(author: String, date: Date, title: String, name: String, text: String) {
        self.author = author
        self.date = date
        self.title = title
        self.name = name
        self.text = text
    }
}
