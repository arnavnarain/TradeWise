//
//  Module.swift
//  TradeWise
//
//  Created by user233615 on 6/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Module: Codable {
    @DocumentID var id: String?
    var title: String
    var name: String
    var lessons: [String]
    var quiz: Quiz
    
    init(title: String, name: String, lessons: [String], quiz: Quiz) {
        self.title = title
        self.name = name
        self.lessons = lessons
        self.quiz = quiz
    }
}

struct Quiz: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var correctAnswerIdx: Int
}
