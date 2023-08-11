//
//  LandingScreenView.swift
//  TradeWise
//
//  Created by user233615 on 6/12/23.
//

import UIKit

class LandingScreenView: UIView {

    var labelText: UILabel!
    var buttonLogin: UIButton!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelText()
        setupbuttonLogin()
        setupbuttonRegister()
        
        initConstraints()
    }
    
    func setupLabelText(){
        labelText = UILabel()
        labelText.text = "Welcome! Please sign in."
        labelText.font = .systemFont(ofSize: 24)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupbuttonLogin(){
        buttonLogin = UIButton(configuration: .filled())
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func setupbuttonRegister(){
        buttonRegister = UIButton(configuration: .filled())
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            buttonRegister.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonRegister.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonLogin.bottomAnchor.constraint(equalTo: buttonRegister.topAnchor, constant: -32),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
