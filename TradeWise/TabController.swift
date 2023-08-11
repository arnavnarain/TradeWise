//
//  TabController.swift
//  TradeWise
//
//  Created by user233615 on 6/12/23.
//

import UIKit

class TabController:  UITabBarController, UITabBarControllerDelegate {
    let notificationCenter = NotificationCenter.default
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabHome = UINavigationController(rootViewController: HomeViewController())
        let tabHomeBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "house.fill")
        )
        tabHome.tabBarItem = tabHomeBarItem
        
        let tabModules = UINavigationController(rootViewController: ModulesViewController())
        let tabModulesBarItem = UITabBarItem(
            title: "Modules",
            image: UIImage(systemName: "graduationcap")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "graduationcap.fill")
        )
        tabModules.tabBarItem = tabModulesBarItem
        
//        let tabProfileController = ProfileViewController()
//        tabProfileController.tabController = self
        let tabProfile = UINavigationController(rootViewController: ProfileViewController())
        let tabProfileBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "person.fill")
        )
        tabProfile.tabBarItem = tabProfileBarItem
//        tabProfile.
        
        //MARK: setting up this view controller as the Tab Bar Controller...
        self.viewControllers = [tabHome, tabModules, tabProfile]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationLogout(notif:)),
            name: .logoutNotification,
            object: nil
        )
        
    }
    
    @objc func notificationLogout(notif: Notification) {
        self.dismiss(animated: true)
    }
}
