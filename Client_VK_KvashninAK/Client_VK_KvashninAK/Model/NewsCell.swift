//
//  NewsCell.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 23.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var fotoView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var avatarView: UIView!
    
    @IBOutlet weak var likeHeart: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var fotoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
    var likeOn: Bool! //= false
    var likeCountInt: Int! //= 1 + Int.random(in: 0...100)
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    func likeAnimate() {
        
        UIView.transition(with: likeCount,
                          duration: 0.5,
                          options: .transitionFlipFromBottom,
                          animations: {
                               if self.likeOn {
                                self.likeOn = false
                                self.likeCountInt -= 1
                                self.likeCount.text = String(self.likeCountInt)
                                self.likeCount.textColor = UIColor.black
                            }
                               else {
                                self.likeOn = true
                                self.likeCountInt += 1
                                self.likeCount.text = String(self.likeCountInt)
                                self.likeCount.textColor = UIColor.red
                            }
        }, completion: { _ in
            
            UIView.animate(withDuration: 0.25,
                           animations: {
                            if self.likeOn {
                                self.likeHeart.tintColor = UIColor.red
                            }
                            else {
                                self.likeHeart.tintColor = UIColor.black
                            }
            },
                           completion: nil)
        })
        
    }
    
    override func draw(_ rect: CGRect) {

        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        //avatarView.layer.shadowColor = UIColor.gray.cgColor
        avatarView.layer.borderWidth = 1
        avatarView.layer.borderColor = UIColor.gray.cgColor
        
        avatarImage.layer.cornerRadius = avatarView.bounds.width / 2
        avatarImage.clipsToBounds = true
        
        
    }

    func configure() {
     
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        addGestureRecognizer(recognizer)
        
        if likeOn {
            likeCount.textColor = UIColor.red
            self.likeHeart.tintColor = UIColor.red
        }
           else {
            likeCount.textColor = UIColor.black
            self.likeHeart.tintColor = UIColor.black
        }
    }
    
    @objc func onTap(_ sender: Any?) {
        likeAnimate()
    }
    
}
