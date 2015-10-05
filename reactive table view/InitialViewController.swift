//
//  InitialViewController.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/4/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    let viewModel = CellViewModel()
    var bindingHelper: TableViewBindingHelper<CellViewModel>!

    @IBOutlet weak var tableView: UITableView! { didSet {
        bindingHelper = TableViewBindingHelper<CellViewModel>(tableView: tableView, sourceSignal: viewModel.cells.producer, reuseIdentifier: "lol", selectionCommand: nil)
    }}
    
    
}
