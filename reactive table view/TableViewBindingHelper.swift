//
//  TableViewBindingHelper.swift
//  reactive table view
//
//  Created by Andrew Breckenridge on 10/4/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

import Foundation
import ReactiveCocoa
import UIKit

protocol ReactiveView {
    var viewModel: AnyObject! { get set }
}

// a helper that makes it easier to bind to UITableView instances
// see: http://www.scottlogic.com/blog/2014/05/11/reactivecocoa-tableview-binding.html
class TableViewBindingHelper<T: AnyObject> : NSObject {
    
    //MARK: Properties
    
    var delegate: UITableViewDelegate?
    
    private let tableView: UITableView
    private let templateCell: UITableViewCell
    private let selectionCommand: Action<AnyObject, (), NoError>!
    private let dataSource: DataSource
    
    //MARK: Public API
    
    init(tableView: UITableView, sourceSignal: SignalProducer<[T], NoError>, nibName: String, selectionCommand: Action<AnyObject, (), NoError>) {
        self.tableView = tableView
        self.selectionCommand = selectionCommand
        
        let nib = UINib(nibName: nibName, bundle: nil)
        
        // create an instance of the template cell and register with the table view
        templateCell = nib.instantiateWithOwner(nil, options: nil)[0] as! UITableViewCell
        tableView.registerNib(nib, forCellReuseIdentifier: templateCell.reuseIdentifier!)
        
        dataSource = DataSource(data: [AnyObject](), templateCell: templateCell)
        
        super.init()
        
        sourceSignal.start { event in
            switch event {
            case let .Next(data):
                self.dataSource.data = data
            default:
                break;
            }
            
            self.tableView.reloadData()
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    init(tableView: UITableView, sourceSignal: SignalProducer<[T], NoError>, reuseIdentifier: String, selectionCommand: (() -> Void)? = nil) {
        self.tableView = tableView
        self.selectionCommand = nil
        
        self.templateCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)!
        dataSource = DataSource(data: [AnyObject](), templateCell: templateCell)
        
        super.init()
        
        sourceSignal.start { event in
            switch event {
            case let .Next(data):
                self.dataSource.data = data
            default:
                break;
            }
            
            self.tableView.reloadData()
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}

class DataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let selectionCommand: RACCommand?
    private let templateCell: UITableViewCell
    var data: [AnyObject]
    
    
    init(data: [AnyObject], templateCell: UITableViewCell, selectionCommand: RACCommand? = nil) {
        self.data = data
        self.templateCell = templateCell
        self.selectionCommand = selectionCommand
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item: AnyObject = data[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(templateCell.reuseIdentifier!)!
        if var reactiveView = cell as? ReactiveView {
            reactiveView.viewModel = item
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return templateCell.frame.size.height
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let selectionCommand = selectionCommand {
            selectionCommand.execute(data[indexPath.row])
        }
    }
    
}