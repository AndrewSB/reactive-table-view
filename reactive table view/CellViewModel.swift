//
//  CellViewModel.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/9/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class CellViewModel: ViewModel {
    let model: CellModel
    
    var backgroundColor: UIColor {
        get {
            return model.backgroundColor
        }
    }
    
    var titleText: String {
        get {
            return "this big \(model.importantNumber)"
        }
    }
    
    init(model: CellModel) {
        self.model = model
    }
}