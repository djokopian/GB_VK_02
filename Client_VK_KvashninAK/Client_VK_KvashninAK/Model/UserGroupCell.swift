//
//  allGroupCell.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 09.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class UserGroupCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleImage: UIImageView!
    
    
    func configure() {
     
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        addGestureRecognizer(recognizer)

    }
    
    @objc func onTap(_ sender: Any?) {
        
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 10.1,
                          animations: {
                            self.titleImage.frame.size.height = self.titleImage.frame.size.height + 10
                            self.titleImage.frame.size.width = self.titleImage.frame.size.width + 10
        }, completion: {_ in
            
        })
        
        
    }
    
}
