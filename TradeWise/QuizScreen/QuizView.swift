//
//  QuizView.swift
//  TradeWise
//
//  Created by user233615 on 6/25/23.
//

import UIKit

class QuizView: UIView {

    var labelQuestionTitle: UILabel!
    var labelQuestion: UILabel!
    var buttonAnswer1: UIButton!
    var buttonAnswer2: UIButton!
    var buttonAnswer3: UIButton!
    var labelResult: UILabel!

    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setup()
        initConstraints()
    }
    
    func setup() {
        labelQuestionTitle = UILabel()
        labelQuestionTitle.text = "Question"
        labelQuestionTitle.font = .boldSystemFont(ofSize: 28)
        labelQuestionTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelQuestionTitle)
        
        labelQuestion = UILabel()
        labelQuestion.text = "Example Question"
        labelQuestion.font = .systemFont(ofSize: 24)
        labelQuestion.numberOfLines = 0
        labelQuestion.lineBreakMode = .byWordWrapping
        labelQuestion.sizeToFit()
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelQuestion)
        
        buttonAnswer1 = UIButton(configuration: .filled())
        buttonAnswer1.setImage(.checkmark, for: .normal)
        buttonAnswer1.setTitle("Answer1", for: .normal)
        buttonAnswer1.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAnswer1.tintColor = .lightGray
        buttonAnswer1.contentHorizontalAlignment = .left
        buttonAnswer1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAnswer1)
        
        buttonAnswer2 = UIButton(configuration: .filled())
        buttonAnswer2.setImage(.checkmark, for: .normal)
        buttonAnswer2.setTitle("Answer2", for: .normal)
        buttonAnswer2.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAnswer2.tintColor = .lightGray
        buttonAnswer2.contentHorizontalAlignment = .left
        buttonAnswer2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAnswer2)
        
        buttonAnswer3 = UIButton(configuration: .filled())
        buttonAnswer3.setImage(.checkmark, for: .normal)
        buttonAnswer3.setTitle("Answer3", for: .normal)
        buttonAnswer3.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAnswer3.tintColor = .lightGray
        buttonAnswer3.contentHorizontalAlignment = .left
        buttonAnswer3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAnswer3)
        
        labelResult = UILabel()
        labelResult.text = ""
        labelResult.font = .boldSystemFont(ofSize: 28)
        labelResult.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelResult)
        
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelQuestionTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            labelQuestionTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelQuestion.topAnchor.constraint(equalTo: labelQuestionTitle.bottomAnchor, constant: 4),
            labelQuestion.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelQuestion.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            labelQuestion.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -36),

            
            buttonAnswer1.topAnchor.constraint(equalTo: labelQuestion.bottomAnchor, constant: 36),
            buttonAnswer1.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAnswer1.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonAnswer2.topAnchor.constraint(equalTo: buttonAnswer1.bottomAnchor, constant: 24),
            buttonAnswer2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAnswer2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonAnswer3.topAnchor.constraint(equalTo: buttonAnswer2.bottomAnchor, constant: 24),
            buttonAnswer3.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAnswer3.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelResult.topAnchor.constraint(equalTo: buttonAnswer3.bottomAnchor, constant: 30),
            labelResult.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
