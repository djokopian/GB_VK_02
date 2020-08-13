//
//  AllGroupController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class AllGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allGroup = [
        "All Группа 01",
        "All Группа 02",
        "All Группа 03",
        "All Группа 04",
        "All Группа 05",
        "All Группа 06",
        "All Группа 07",
        "All Группа 08",
        "All Группа 09"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
}


extension AllGroupViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupCell") as? UserGroupCell else { fatalError() }
        
        cell.titleLabel.text = allGroup[indexPath.row]
        //cell.titleImage.image = 
        
        return cell
    }
    
    
}
