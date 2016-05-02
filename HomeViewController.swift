//
//  HomeViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 21/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class HomeViewController: UIViewController {
    
    weak var delegate:HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}
