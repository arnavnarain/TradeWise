//
//  ProfileView.swift
//  TradeWise
//
//  Created by user233615 on 6/13/23.
//

import UIKit

class ProfileView: UIView {
    var profilePic: UIImageView!
    var labelText: UILabel!
    var lessonCard: UIView!
    var lessonsLabel: UITextView!
    var lessonHistoryLabel: UILabel!
    
    var labelPoints: UILabel!
    var labelComments: UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupProfilePic()
        setupLabelText()
        
        setupLabels()
        setupLessonCard()
        initConstraints()
    }
    
    func makeColorFromHex(hex: Int) -> UIColor {
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        return color
    }
    
    func setupLabels() {
        lessonHistoryLabel = UILabel()
        lessonHistoryLabel.text = "Lesson History"
        lessonHistoryLabel.font = .boldSystemFont(ofSize: 21)
        lessonHistoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(lessonHistoryLabel)
    }
    
    func setupLessonCard() {
        lessonCard = UIView()
        lessonCard.backgroundColor = makeColorFromHex(hex: 0xE7BFDE)
        lessonCard.layer.cornerRadius = 20
        lessonCard.layer.shadowColor = UIColor.lightGray.cgColor
        lessonCard.layer.shadowOffset = .zero
        lessonCard.layer.shadowRadius = 4.0
        lessonCard.layer.shadowOpacity = 0.7
        lessonCard.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lessonCard)
        
        
        lessonsLabel = UITextView()
        lessonsLabel.text = ""
        lessonsLabel.font = .boldSystemFont(ofSize: 21)
        lessonsLabel.translatesAutoresizingMaskIntoConstraints = false
        lessonsLabel.textColor = .black
        lessonsLabel.isEditable = false
        lessonsLabel.isScrollEnabled = false
        lessonsLabel.backgroundColor = UIColor.clear
        
        lessonsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lessonCard.addSubview(lessonsLabel)
        

    }
    
    func setupProfilePic() {
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 32)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
        
        labelPoints = UILabel()
        labelPoints.font = .boldSystemFont(ofSize: 32)
        labelPoints.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPoints)
        
        labelComments = UILabel()
        labelComments.font = .boldSystemFont(ofSize: 32)
        labelComments.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelComments)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 128),
            profilePic.heightAnchor.constraint(equalToConstant: 128),
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            
            
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            labelText.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 16),
            
            
            labelPoints.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 16),
            labelPoints.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            
            labelComments.topAnchor.constraint(equalTo: labelPoints.bottomAnchor, constant: 16),
            labelComments.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            
            lessonHistoryLabel.topAnchor.constraint(equalTo: labelComments.bottomAnchor, constant: 32),
            lessonHistoryLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            lessonCard.topAnchor.constraint(equalTo: lessonHistoryLabel.bottomAnchor, constant: 8),
            lessonCard.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            lessonCard.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            lessonCard.heightAnchor.constraint(equalTo: lessonsLabel.heightAnchor, constant: 32),
            
            lessonsLabel.topAnchor.constraint(equalTo: lessonCard.topAnchor, constant: 16),
            lessonsLabel.leadingAnchor.constraint(equalTo: lessonCard.leadingAnchor, constant: 16),
            lessonsLabel.trailingAnchor.constraint(equalTo: lessonCard.trailingAnchor, constant: -16),
            lessonsLabel.bottomAnchor.constraint(equalTo: lessonCard.bottomAnchor)
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
