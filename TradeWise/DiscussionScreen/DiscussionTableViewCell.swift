//
//  DiscussionTableViewCell.swift
//  TradeWise
//
//  Created by user233615 on 6/24/23.
//

import UIKit

class DiscussionTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelTimeStamp: UILabel!
    var labelText: UILabel!
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelTimeStamp()
        setupLabelText()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
//        wrapperCellView.layer.cornerRadius = 6.0
//        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
//        wrapperCellView.layer.shadowOffset = .zero
//        wrapperCellView.layer.shadowRadius = 4.0
//        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.sizeToFit()
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 14)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelTimeStamp(){
        labelTimeStamp = UILabel()
        labelTimeStamp.font = UIFont.boldSystemFont(ofSize: 10)
        labelTimeStamp.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTimeStamp)
    }
    
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = UIFont.systemFont(ofSize: 16)
        labelText.numberOfLines = 0 // 0 = no limit to line count
        labelText.lineBreakMode = .byWordWrapping
        labelText.sizeToFit()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelText)
    }
    
    
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                
                labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 7),
//                labelName.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -7),
                labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
              
                labelText.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
                labelText.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
                labelText.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
                
                
                labelTimeStamp.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 8),
                labelTimeStamp.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
                
                
//                wrapperCellView.heightAnchor.constraint(equalToConstant: 75),
                wrapperCellView.widthAnchor.constraint(equalToConstant: 230)
            ])
      
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



}
