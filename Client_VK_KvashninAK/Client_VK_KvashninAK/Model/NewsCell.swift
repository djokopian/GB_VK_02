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
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    override func draw(_ rect: CGRect) {

        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        //avatarView.layer.shadowColor = UIColor.gray.cgColor
        avatarView.layer.borderWidth = 1
        avatarView.layer.borderColor = UIColor.gray.cgColor
        
        avatarImage.layer.cornerRadius = avatarView.bounds.width / 2
        avatarImage.clipsToBounds = true
        
        
    }

}
