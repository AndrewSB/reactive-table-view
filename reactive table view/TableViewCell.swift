//
//  TableViewCell.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/9/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, ReactiveView {
    var viewModel: AnyObject? {
        didSet {
            guard let viewModel = viewModel as? CellViewModel else {return}
            self.backgroundColor = viewModel.backgroundColor
            self.textLabel?.text = viewModel.titleText
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
