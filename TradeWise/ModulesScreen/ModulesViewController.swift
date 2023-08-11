//
//  ModulesViewController.swift
//  TradeWise
//
//  Created by user233615 on 6/13/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ModulesViewController: UIViewController {

    let db = Firestore.firestore()
    
    var modules = [Module]()
    let modulesView = ModulesView()
    
    override func loadView() {
        view = modulesView
        // test module to force the table to show (not working sadly)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
//        navigationController?.navigationBar.isHidden = true
        title = "Modules"
        
        modulesView.tableViewModules.delegate = self
        modulesView.tableViewModules.dataSource = self
        modulesView.tableViewModules.separatorStyle = .none
        
        getModules()
        
        modulesView.tableViewModules.reloadData()
        print("Modules after reloading = \(modules)")
    }
    
    func getModules() {
        let modulesRef = db.collection("modules")
        modulesRef.addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    do {
                        let mod = try document.data(as: Module.self)
                        print("Retrieved module: \(mod)")
                        self.modules.append(mod)
                        self.modulesView.tableViewModules.reloadData()

                    }
                    catch {
                        print("Error!!!")
                        print(error)
                    }
                }
                self.modulesView.tableViewModules.reloadData()
            }
        }
    }
}
