//
//  FriendsController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userFriends = [
        "El Amigo 01",
        "La Amiga 02",
        "El Amigo 03",
        "La Amiga 04",
        "La Amiga 05",
        "El Amigo 06",
        "El Amigo 07",
        "La Amiga 08",
        "La Amiga 09"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
}


extension FriendsController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell") as? FriendsCell else { fatalError() }
        
        cell.titleLabel.text = userFriends[indexPath.row]
        
        return cell
    }
    
    
}
