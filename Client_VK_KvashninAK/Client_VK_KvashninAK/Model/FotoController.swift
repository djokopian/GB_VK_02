//
//  FotoController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 25.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FotoController: UIViewController{
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fotoView = FotoControllerCell(frame: CGRect(x: 0, y: view.layer.bounds.height/4, width: view.layer.bounds.width, height: view.layer.bounds.width))
        
        
        fotoView.configure()
        
        view.addSubview(fotoView)
        
    }
    
}

