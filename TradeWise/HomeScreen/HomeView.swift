//
//  HomeView.swift
//  TradeWise
//
//  Created by user233615 on 6/12/23.
//

import UIKit

class HomeView: UIView {
    
    var welcomeCardView: UIView!
    var labelWelcome: UILabel!
    var labelName: UILabel!
    var labelDate: UILabel!
    
    var pointsCardView: UIView!
    var labelPoints: UILabel!

    var commentsCardView: UIView!
    var labelComments: UILabel!

    var lastLessonView: UIView!
    var labelPickUpFrom: UILabel!
    var labelLastLessonTitle: UILabel!
    var labelLastLessonName: UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupCardViews()
        setupLabels()
        initConstraints()
    }
    
    func makeColorFromHex(hex: Int) -> UIColor {
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        return color
    }
    
    func setupCardViews() {
        welcomeCardView = UIView()
        welcomeCardView.backgroundColor = makeColorFromHex(hex: 0xACE9FC)
        welcomeCardView.layer.cornerRadius = 20
        welcomeCardView.layer.shadowColor = UIColor.lightGray.cgColor
        welcomeCardView.layer.shadowOffset = .zero
        welcomeCardView.layer.shadowRadius = 4.0
        welcomeCardView.layer.shadowOpacity = 0.7
        welcomeCardView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(welcomeCardView)
        
        pointsCardView = UIView()
        pointsCardView.backgroundColor = makeColorFromHex(hex: 0x75EDC2)
        pointsCardView.layer.cornerRadius = 20
        pointsCardView.layer.shadowColor = UIColor.lightGray.cgColor
        pointsCardView.layer.shadowOffset = .zero
        pointsCardView.layer.shadowRadius = 4.0
        pointsCardView.layer.shadowOpacity = 0.7
        pointsCardView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pointsCardView)
        
        commentsCardView = UIView()
        commentsCardView.backgroundColor = makeColorFromHex(hex: 0x75EDC2)
        commentsCardView.layer.cornerRadius = 20
        commentsCardView.layer.shadowColor = UIColor.lightGray.cgColor
        commentsCardView.layer.shadowOffset = .zero
        commentsCardView.layer.shadowRadius = 4.0
        commentsCardView.layer.shadowOpacity = 0.7
        commentsCardView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(commentsCardView)
        
        lastLessonView = UIView()
        lastLessonView.backgroundColor = makeColorFromHex(hex: 0xE7BFDE)
        lastLessonView.layer.cornerRadius = 20
        lastLessonView.layer.shadowColor = UIColor.lightGray.cgColor
        lastLessonView.layer.shadowOffset = .zero
        lastLessonView.layer.shadowRadius = 4.0
        lastLessonView.layer.shadowOpacity = 0.7
        lastLessonView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lastLessonView)
    }
    
    func setupLabels() {
        labelWelcome = UILabel()
        labelWelcome.text = "Welcome,"
        labelWelcome.font = .systemFont(ofSize: 48)
        labelWelcome.translatesAutoresizingMaskIntoConstraints = false
        welcomeCardView.addSubview(labelWelcome)
        
        labelName = UILabel()
        labelName.text = "Name"
        labelName.font = .boldSystemFont(ofSize: 48)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        welcomeCardView.addSubview(labelName)
        
        let df = DateFormatter()
        df.dateFormat = "MMM d, YYYY"
        let date_str = df.string(from: Date())
        
        labelDate = UILabel()
        labelDate.text = date_str
        labelDate.font = .systemFont(ofSize: 20)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        welcomeCardView.addSubview(labelDate)
        
        labelPoints = UILabel()
        labelPoints.text = "Points: "
        labelPoints.font = .systemFont(ofSize: 20)
        labelPoints.translatesAutoresizingMaskIntoConstraints = false
        pointsCardView.addSubview(labelPoints)
        
        labelComments = UILabel()
        labelComments.text = "Comments: "
        labelComments.font = .systemFont(ofSize: 20)
        labelComments.translatesAutoresizingMaskIntoConstraints = false
        commentsCardView.addSubview(labelComments)
        
        labelPickUpFrom = UILabel()
        labelPickUpFrom.text = "Pick up from:"
        labelPickUpFrom.font = .boldSystemFont(ofSize: 24)
        labelPickUpFrom.translatesAutoresizingMaskIntoConstraints = false
        lastLessonView.addSubview(labelPickUpFrom)
        
        labelLastLessonTitle = UILabel()
        labelLastLessonTitle.text = ""
        labelLastLessonTitle.font = .boldSystemFont(ofSize: 21)
        labelLastLessonTitle.translatesAutoresizingMaskIntoConstraints = false
        lastLessonView.addSubview(labelLastLessonTitle)
        
        labelLastLessonName = UILabel()
        labelLastLessonName.text = "Lesson Name"
        labelLastLessonName.font = .systemFont(ofSize: 20)
        labelLastLessonName.translatesAutoresizingMaskIntoConstraints = false
        lastLessonView.addSubview(labelLastLessonName)

    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            welcomeCardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            welcomeCardView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            welcomeCardView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            
            labelWelcome.topAnchor.constraint(equalTo: welcomeCardView.topAnchor, constant: 16),
            labelWelcome.leadingAnchor.constraint(equalTo: welcomeCardView.leadingAnchor, constant: 16),
            
            
            labelName.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 6),
            labelName.leadingAnchor.constraint(equalTo: welcomeCardView.leadingAnchor, constant: 16),
            
            
            labelDate.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelDate.trailingAnchor.constraint(equalTo: welcomeCardView.trailingAnchor, constant: -16),
            
            welcomeCardView.bottomAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 16),
            
            commentsCardView.heightAnchor.constraint(equalToConstant: 64),
            commentsCardView.topAnchor.constraint(equalTo: welcomeCardView.bottomAnchor, constant: 16),
            commentsCardView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -192),
            commentsCardView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            labelComments.centerYAnchor.constraint(equalTo: commentsCardView.centerYAnchor),
            labelComments.leadingAnchor.constraint(equalTo: commentsCardView.leadingAnchor, constant: 16),
            
            
            pointsCardView.heightAnchor.constraint(equalToConstant: 64),
            pointsCardView.topAnchor.constraint(equalTo: welcomeCardView.bottomAnchor, constant: 16),
            pointsCardView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            pointsCardView.trailingAnchor.constraint(equalTo: self.commentsCardView.leadingAnchor, constant: -16),
            labelPoints.centerYAnchor.constraint(equalTo: pointsCardView.centerYAnchor),
            labelPoints.leadingAnchor.constraint(equalTo: pointsCardView.leadingAnchor, constant: 16),
            
            
            lastLessonView.topAnchor.constraint(equalTo: commentsCardView.bottomAnchor, constant: 16),
            lastLessonView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            lastLessonView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),


            labelPickUpFrom.topAnchor.constraint(equalTo: lastLessonView.topAnchor, constant: 16),
            labelPickUpFrom.leadingAnchor.constraint(equalTo: lastLessonView.leadingAnchor, constant: 16),

            labelLastLessonTitle.topAnchor.constraint(equalTo: labelPickUpFrom.bottomAnchor, constant: 16),
            labelLastLessonTitle.leadingAnchor.constraint(equalTo: lastLessonView.leadingAnchor, constant: 16),
            
            labelLastLessonName.topAnchor.constraint(equalTo: labelLastLessonTitle.bottomAnchor, constant: 16),
            labelLastLessonName.leadingAnchor.constraint(equalTo: lastLessonView.leadingAnchor, constant: 16),

            lastLessonView.bottomAnchor.constraint(equalTo: labelLastLessonName.bottomAnchor, constant: 16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
