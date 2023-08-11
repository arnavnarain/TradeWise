//
//  TextScreenView.swift
//  TradeWise
//
//  Created by user239353 on 6/24/23.
//
import UIKit

class TextScreenView: UIView {
    
    var scrollView: UIScrollView!
    var authorName: UILabel!
    var date: UILabel!
    var title: UILabel!
    var name: UILabel!
    var text: UITextView!

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupScrollView()
        setupLabels()
        initConstraints()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }


    func setupLabels() {
        authorName = UILabel()
        date = UILabel()
        title = UILabel()
        name = UILabel()
        text = UITextView()

        title.font = UIFont.boldSystemFont(ofSize: 30)
        name.font = .boldSystemFont(ofSize: 24)

//        text.numberOfLines = 0
//        text.sizeToFit()
        text.font = .systemFont(ofSize: 16)
        text.textColor = .black
        text.isEditable = false
        text.isScrollEnabled = false
//        text.isUserInteractionEnabled = true

        authorName.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(authorName)
        scrollView.addSubview(date)
        scrollView.addSubview(title)
        scrollView.addSubview(name)
        scrollView.addSubview(text)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),

            title.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 4),
//            title.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 4),
            title.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),

            authorName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            authorName.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),

            date.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 8),
            date.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),

            text.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 16),
            text.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            text.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            text.bottomAnchor.constraint(lessThanOrEqualTo: self.scrollView.bottomAnchor, constant: -16),
            text.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -32)
        ])
    }



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


}
