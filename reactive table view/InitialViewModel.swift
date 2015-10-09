//
//  InitialViewModel.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/4/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import ReactiveCocoa

class InitialViewModel {

    var cells = MutableProperty([CellViewModel]())
    
    init() {
        self.cells.value.append(CellViewModel(model: CellModel()))
        
        NSTimer.schedule(repeatInterval: 2) { _ in
            self.cells.value.append(CellViewModel(model: CellModel()))
        }
    }
}