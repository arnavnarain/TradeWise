//
//  ModulesView.swift
//  TradeWise
//
//  Created by user233615 on 6/13/23.
//

import UIKit

class ModulesView: UIView {

//    var labelTitle: UILabel!
    
    var tableViewModules: UITableView!

    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
//        setupTitle() //.. Dont really need this rn
        setupTableViewModules()
        initConstraints()
    }
//
//    func setupTitle() {
//        labelTitle = UILabel()
//        labelTitle.text = "Modules"
//        labelTitle.font = labelTitle.font.withSize(32)
//        labelTitle.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(labelTitle)
//    }
//
    func setupTableViewModules(){
        tableViewModules = UITableView()
        tableViewModules.register(ModulesTableViewCell.self, forCellReuseIdentifier: Configs.moduleCellID)
        tableViewModules.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewModules)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            tableViewModules.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableViewModules.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewModules.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewModules.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
//            labelTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
//            labelTitle.topAnchor.constraint(equalTo: tableViewModules.bottomAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
