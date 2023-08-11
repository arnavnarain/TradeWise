//
//  DiscussionView.swift
//  TradeWise
//
//  Created by user233615 on 6/24/23.
//

import UIKit

class DiscussionView: UIView {

    var tableViewPosts: UITableView!

    var bottomAddView: UIView!
    var textFieldChat: UITextField!
    var buttonSend: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        setupTableViewPosts()
            
        setupBottomAddView()
        setupTextFieldChat()
        setupButtonSend()
            
        initConstraints()
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewPosts(){
        tableViewPosts = UITableView()
        tableViewPosts.register(DiscussionTableViewCell.self, forCellReuseIdentifier: Configs.discussionCellID)
        tableViewPosts.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPosts)
    }
        
        //MARK: the bottom add contact view....
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
        
    func setupTextFieldChat(){
        textFieldChat = UITextField()
        textFieldChat.placeholder = "Text Message"
        textFieldChat.borderStyle = .roundedRect
        textFieldChat.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldChat)
    }
    
    
    func setupButtonSend(){
        buttonSend = UIButton(type: .system)
        buttonSend.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSend.setTitle("Post", for: .normal)
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonSend)
    }
        
        func initConstraints(){
            NSLayoutConstraint.activate([
                //bottom add view...
                bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
                bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
                buttonSend.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
                buttonSend.leadingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -60),
                buttonSend.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
                
                textFieldChat.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
                textFieldChat.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
                textFieldChat.trailingAnchor.constraint(equalTo: buttonSend.leadingAnchor, constant: -4),
                
              
                
                bottomAddView.topAnchor.constraint(equalTo: textFieldChat.topAnchor, constant: -8),
                //...
                
                tableViewPosts.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
                tableViewPosts.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                tableViewPosts.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                tableViewPosts.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
                
                
            ])
        }
        
        
        //MARK: initializing constraints...
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    


}
