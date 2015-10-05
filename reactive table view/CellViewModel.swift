//
//  CellViewModel.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/4/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

class CellViewModel {

    var cells = MutableProperty<CellModel>([CellModel]())
    
    init() {
        NSTimer.schedule(repeatInterval: 5) {
            self.cells.value.append(CellModel())
 
        }
    }
}