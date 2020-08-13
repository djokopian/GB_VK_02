//
//  Session.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 13.08.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init () {
        
    }
    
    var token: String = ""
    var userId: Int = 0
}
