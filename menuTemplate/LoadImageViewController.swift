//
//  LoadImageViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 26/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol LoadImageViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class LoadImageViewController: UIViewController {
    
    weak var delegate:LoadImageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}
