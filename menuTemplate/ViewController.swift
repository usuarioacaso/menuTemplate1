//
//  ViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 21/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate:NSObjectProtocol {
    func selectedIndexPath(indexPath:NSIndexPath)
}

class ViewController: UIViewController {
    
    weak var delegate:ViewControllerDelegate?
    
    private let itemsMenu = ["Home", "Share", "User", "Location", "Closure","LoadImage"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsMenu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = itemsMenu[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.selectedIndexPath(indexPath)
    }
}

