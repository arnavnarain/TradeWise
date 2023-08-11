//
//  ModulesTableManager.swift
//  TradeWise
//
//  Created by user233615 on 6/23/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

extension LessonsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.lessonCellID, for: indexPath) as! LessonsTableViewCell
        
        let currLesson = lessons[indexPath.row]
        cell.labelLessonTitle.text = currLesson.title
        cell.labelLessonName.text = currLesson.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currLesson = lessons[indexPath.row]
        updateLessonStats(lessonTitle: currLesson.title, lessonName: currLesson.name)
        
        let textController = TextScreenViewController()
        textController.lesson = currLesson
        self.navigationController?.pushViewController(textController, animated: true)
    }
    
    func updateLessonStats(lessonTitle: String, lessonName: String) {
        db.collection("stats").document((currentUser?.email)!).updateData([
            "points": FieldValue.increment(Int64(1)),
            "last_lesson_title": lessonTitle,
            "last_lesson_name": lessonName,
        ]) { err in
            if let err = err {
                print("Unable to save last lesson and increment points! Error: \(err)")
            } else {
//                print("Document successfully updated")
            }
        }
    }

}
