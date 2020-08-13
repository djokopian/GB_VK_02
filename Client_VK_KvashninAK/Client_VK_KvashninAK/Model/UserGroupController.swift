//
//  allGroupController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userGroup = [
        "Группа 01",
        "Группа 02",
        "Группа 03",
        "Группа 04",
        "Группа 05",
        "Группа 06",
        "Группа 07",
        "Группа 08",
        "Группа 09"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        
    }
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        
        
        if segue.identifier == "addGroup" {
        
            guard let allGroupViewController = segue.source as? AllGroupViewController else { return }
        
            if let indexPath = allGroupViewController.tableView.indexPathForSelectedRow {
       
                let group = allGroupViewController.allGroup[indexPath.row]
        
                if !userGroup.contains(group) {
        
                    userGroup.append(group)
        
                    tableView.reloadData()
                }
            }
        }

        
    }

    
}


extension GroupViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupCell") as? UserGroupCell else { fatalError() }
        
        cell.titleLabel.text = userGroup[indexPath.row]
        
        cell.configure()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userGroup.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    
}
