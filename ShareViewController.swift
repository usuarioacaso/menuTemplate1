//
//  ShareViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 22/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol ShareViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class ShareViewController: UIViewController {
    
    weak var delegate:ShareViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}
