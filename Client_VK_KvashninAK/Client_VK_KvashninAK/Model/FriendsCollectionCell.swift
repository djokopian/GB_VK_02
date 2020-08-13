//
//  FriendsImage.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FriendsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var like: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    var likeOn: Bool = false
    var likeCountInt: Int = Int.random(in: 0...100)

    
    func configure() {
     
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        addGestureRecognizer(recognizer)
    }
    
    @objc func onTap(_ sender: Any?) {
        if likeOn {
            likeOn = false
            like.image = UIImage(systemName: "heart.fill")
            like.tintColor = UIColor.red
            likeCountInt += 1
            likeCount.text = String(likeCountInt)
            likeCount.textColor = UIColor.red
        }
        else {
            likeOn = true
            like.image = UIImage(systemName: "heart")
            like.tintColor = UIColor.gray
            likeCountInt -= 1
            likeCount.text = String(likeCountInt)
            likeCount.textColor = UIColor.gray
        }
    }
    

}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
