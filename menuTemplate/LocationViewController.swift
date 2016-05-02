//
//  LocationViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 22/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol LocationViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class LocationViewController: UIViewController {
    
    weak var delegate:LocationViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}
