//
//  ModulesTableViewCell.swift
//  TradeWise
//
//  Created by user233615 on 6/23/23.
//

import UIKit

class ModulesTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelModuleTitle: UILabel!
    var labelModuleName: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelModuleName()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelModuleName(){
        labelModuleTitle = UILabel()
        labelModuleTitle.font = UIFont.boldSystemFont(ofSize: 22)
        labelModuleTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelModuleTitle)
        
        labelModuleName = UILabel()
        labelModuleName.font = .systemFont(ofSize: 20)
        labelModuleName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelModuleName)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelModuleTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
//            labelModuleTitle.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor, constant: 0),
            labelModuleTitle.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelModuleTitle.heightAnchor.constraint(equalToConstant: 20),
            labelModuleTitle.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelModuleName.topAnchor.constraint(equalTo: labelModuleTitle.bottomAnchor, constant: 8),
//            labelModuleName.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor, constant: 0),
            labelModuleName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelModuleName.heightAnchor.constraint(equalToConstant: 20),
            labelModuleName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)

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
