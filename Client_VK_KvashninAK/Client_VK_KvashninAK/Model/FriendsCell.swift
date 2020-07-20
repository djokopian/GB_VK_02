//
//  FriendsCell.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var avatarContanerView: UIView!
    
    @IBOutlet weak var titleImage: UIImageView!
 

    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    override func draw(_ rect: CGRect) {

        avatarContanerView.layer.cornerRadius = avatarContanerView.bounds.width / 2
        avatarContanerView.layer.shadowColor = UIColor.gray.cgColor
        avatarContanerView.layer.shadowRadius = 15
        avatarContanerView.layer.shadowOpacity = 0.85
        
        avatarContanerView.layer.shadowPath = UIBezierPath(ovalIn: avatarContanerView.bounds).cgPath
        
        titleImage.layer.cornerRadius = avatarContanerView.bounds.width / 2
        titleImage.clipsToBounds = true
        
        
    }
    
}

