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
    
    @IBOutlet weak var loadingVIew: UIView!
    @IBOutlet weak var loadingImage1, loadingImage2, loadingImage3: UIImageView!
    
    var likeOn: Bool = false
    var likeCountInt: Int = Int.random(in: 0...100)

    func lodingAnimate() {
        
        let time = Int.random(in: 2...5)
        
        UIView.animate(withDuration: 1,
        delay: Double(time),
        animations: {
            self.loadingVIew.alpha = 0
        },
        completion: { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.image.alpha = 1.0
                self.likeCount.alpha = 1.0
                self.like.alpha = 1.0
            })
        })

        UIView.animate(withDuration: 1, delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loadingImage1.alpha = 0

        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1/3,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loadingImage2.alpha = 0

        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 2/3,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loadingImage3.alpha = 0

        }, completion: nil)
        
    }
    
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


//extension UIImageView {
//  func setImageColor(color: UIColor) {
//    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
//    self.image = templateImage
//    self.tintColor = color
//  }
//}
