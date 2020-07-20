//
//  UserFriendsCollection.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FriendsCollectionController: UIViewController {
    
    @IBOutlet weak var collecionView: UICollectionView!
    
    var friendImage = [
        "person",
        "person.fill",
        "person.circle",
        "person.circle.fill",
        "person.icloud",
        "person.2.fill"
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collecionView.dataSource = self
        
        
    }
    
    
}


extension FriendsCollectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCollectionCell", for: indexPath) as? FriendsCollectionCell else { fatalError() }
        
        cell.image.image = UIImage(systemName: friendImage[indexPath.row])
            //UIImage(named: friendImage[indexPath.row])
        
        cell.configure()
        
        cell.likeCount.text = String(cell.likeCountInt)
        
        return cell
    }
    
    
}




