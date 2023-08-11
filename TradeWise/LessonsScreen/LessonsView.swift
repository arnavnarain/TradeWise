//
//  LessonsView.swift
//  TradeWise
//
//  Created by user239353 on 6/24/23.
//

import UIKit

class LessonsView: UIView {

    var buttonQuiz: UIButton!
    var buttonViewDiscussion: UIButton!
    var tableViewLessons: UITableView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupButtons()
        setupTableViewModules()
        initConstraints()
    }
    
    
    func setupButtons() {
        buttonQuiz = UIButton(type: .roundedRect)
        buttonQuiz.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonQuiz.setImage(UIImage(systemName: "books.vertical"), for: .normal)
        buttonQuiz.setTitle("Knowledge Check", for: .normal)
        buttonQuiz.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonQuiz)
        
        
        buttonViewDiscussion = UIButton(type: .roundedRect)
        buttonViewDiscussion.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonViewDiscussion.setTitle("View Discussion", for: .normal)
        buttonViewDiscussion.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonViewDiscussion)
    }

    func setupTableViewModules(){
        tableViewLessons = UITableView()
        tableViewLessons.register(LessonsTableViewCell.self.self, forCellReuseIdentifier: Configs.lessonCellID)
        tableViewLessons.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewLessons)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            buttonQuiz.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 4),
            buttonQuiz.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonQuiz.heightAnchor.constraint(equalToConstant: 12),
            
            buttonViewDiscussion.topAnchor.constraint(equalTo: buttonQuiz.bottomAnchor, constant: 16),
            buttonViewDiscussion.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonViewDiscussion.heightAnchor.constraint(equalToConstant: 12),
            
            tableViewLessons.topAnchor.constraint(equalTo: buttonViewDiscussion.bottomAnchor, constant: 16),
            tableViewLessons.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewLessons.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewLessons.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
