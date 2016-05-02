//
//  UserViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 22/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol UserViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class UserViewController: UIViewController {
    
    weak var delegate:UserViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}
