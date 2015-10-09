//
//  CellModel.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/4/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import UIKit // bad practice, importing because foundation can't represent a background color

struct CellModel {
    
    let importantNumber: Int
    let backgroundColor: UIColor
    
    init() {
        importantNumber = Int(arc4random_uniform(999))
        backgroundColor = UIColor.randomColor()
        
        print("inited cell model")
    }
    
}