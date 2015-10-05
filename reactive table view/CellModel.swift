//
//  CellModel.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/4/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

class CellModel {
    
    let someNumber: Int
    
    init() {
        someNumber = Int(arc4random_uniform(999))
        
        print("inited cell model")
    }
    
}