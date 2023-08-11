//
//  ViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/8/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    let landingView = LandingScreenView()
    let homeViewController = HomeViewController()
    var homeViewNavController: UINavigationController!
    
    let tabController = TabController()
    var tabNavController: UINavigationController!
        
    override func loadView() {
        view = landingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "TradeWise"
        
        landingView.buttonLogin.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        landingView.buttonRegister.addTarget(self, action: #selector(onSignupTapped), for: .touchUpInside)
    }
    
    @objc func onLoginTapped() {
//        self.navigationController?.pu
        UserDefaults.standard.setValue("hello", forKey: "loggedin")
        let signInAlert = UIAlertController(
            title: "Sign In",
            message: "Please sign in to continue.",
            preferredStyle: .alert)

        //MARK: setting up email textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }

        //MARK: setting up password textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }

        //MARK: Sign In Action...
        let signInAction = UIAlertAction(title: "Log In", style: .default, handler: {(_) in
            if let email = signInAlert.textFields![0].text,
               let password = signInAlert.textFields![1].text{
                //MARK: sign-in logic for Firebase...
                
                Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
                    if error == nil {
                        self.showTabController()
                    } else {
                        self.showErrorAlert("Incorrect username or password")
                    }
                })
            }
        })



        //MARK: action buttons...
        signInAlert.addAction(signInAction)

        self.present(signInAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            signInAlert.view.superview?.isUserInteractionEnabled = true
            signInAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
            
    func showErrorAlert(_ msg: String) {
        let alert = UIAlertController(title: "Uh oh!", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default))
        self.present(alert, animated:true)
    }
   
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }

    
    @objc func onSignupTapped() {
        let signupScreen = SignUpViewController()
        navigationController?.pushViewController(signupScreen, animated: true)
    }
    
    
    
    func showTabController() {
        //MARK: setting up bottom search sheet...
        tabNavController = UINavigationController(rootViewController: tabController)
        tabNavController.modalPresentationStyle = .fullScreen
        tabNavController.modalTransitionStyle = .coverVertical

        present(tabNavController, animated: true)
    }
}

