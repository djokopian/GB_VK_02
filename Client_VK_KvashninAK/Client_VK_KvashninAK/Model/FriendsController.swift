//
//  FriendsController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FriendsController: UIViewController, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userFriends = [
        "Amigo viejo",
        "Amiga linde",
        "Tio alto",
        "Tia baja",
        "Hermano aburrido",
        "Hermana guapa",
        "Abuelo viejo",
        "Abuela buena",
        "El gato divertido"
    ]
    
    var userFriendsSec:[Character: [String]] = [:]
    
    var userTitle:[Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        for friend in userFriends {
            let firstLatter =  friend.first!
            
            if userFriendsSec[firstLatter] != nil {
                userFriendsSec[firstLatter]?.append(friend)
            }
            else { userFriendsSec[firstLatter] = [friend] }
        }
        
        userTitle = Array(userFriendsSec.keys)
        userTitle.sort()
        
        tableView.register(UINib(nibName: "SectionFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")

    
      
    
    }
}


extension FriendsController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFriendsSec[userTitle[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userFriendsSec.count
    }
    


    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
          
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? SectionFooter
        
        
        header?.titleLabel.text = String(userTitle[section])

        header?.view.backgroundColor = .gray
        header?.view.alpha = 0.3
        
        header?.view.frame = .init(x: 0, y: 0, width: tableView.bounds.size.width, height: 30)
        
        print("header")
        return header
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return userTitle.map { String($0) }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell") as? FriendsCell else { fatalError() }
        
        guard let user = userFriendsSec[userTitle[indexPath.section]]?[indexPath.row ]
            else {
                fatalError()
        }
        
        cell.titleLabel.text = user
        
        //cell.avatarContanerView.configure()
        
        return cell
    }
    
    
}
