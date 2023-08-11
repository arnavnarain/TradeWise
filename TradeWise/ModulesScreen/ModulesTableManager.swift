//
//  ModulesTableManager.swift
//  TradeWise
//
//  Created by user233615 on 6/23/23.
//

import Foundation
import UIKit

extension ModulesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.moduleCellID, for: indexPath) as! ModulesTableViewCell
        
        let currModule = modules[indexPath.row]
        cell.labelModuleTitle.text = currModule.title
        cell.labelModuleName.text = currModule.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let module = modules[indexPath.row]
        let lessonsController = LessonsViewController()
        lessonsController.moduleName = module.name
        lessonsController.moduleIndex = indexPath.row + 1
        lessonsController.quiz = module.quiz
        self.navigationController?.pushViewController(lessonsController, animated: true)

    }

}
