//
//  DiscussionTableViewManager.swift
//  TradeWise
//
//  Created by user233615 on 6/24/23.
//


import Foundation
import UIKit

extension DiscussionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discussion.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.discussionCellID, for: indexPath) as! DiscussionTableViewCell
        
        let currPost = discussion.posts[indexPath.row]
        
        let df = DateFormatter()
        df.dateFormat = "EEE, MMM d 'at' hh:mm a"
        let date_str = df.string(from: currPost.date)
        
        cell.labelName.text = currPost.user
        cell.labelTimeStamp.text = date_str
        cell.labelText.text = currPost.text
        cell.labelText.sizeToFit()
        cell.wrapperCellView.bottomAnchor.constraint(equalTo: cell.labelTimeStamp.bottomAnchor, constant: 8).isActive = true
        return cell
        
    }
}
