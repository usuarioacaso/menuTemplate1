//
//  MainViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 21/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import MMDrawerController

class MainViewController: MMDrawerController {
    
    private let rowHome = 0
    private let rowShare = 1
    private let rowUser = 2
    private let rowLocation = 3
    private let rowClosure = 4
    private let rowLoadImage = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        // asigna el viewController del centro
        if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navHomeViewController") as? UINavigationController {
            centerViewController = navigationController
            if let viewController = navigationController.topViewController as? HomeViewController {
                viewController.delegate = self
            }
        }
        
        // agrtegar al menu al left
        if let menuViewController = storyboard?.instantiateViewControllerWithIdentifier("menuViewController") as? ViewController {
            leftDrawerViewController = menuViewController
            menuViewController.delegate = self
        }
    }
}

extension MainViewController:HomeViewControllerDelegate, ShareViewControllerDelegate, UserViewControllerDelegate, LocationViewControllerDelegate, ClosureViewControllerDelegate, LoadImageViewControllerDelegate {
    func openCloseMenu() {
        if openSide == MMDrawerSide.Left {
            closeDrawerAnimated(true, completion: { (finished) -> Void in
            })
        }else{
            openDrawerSide(MMDrawerSide.Left, animated: true, completion: {(finished) -> Void in
            })
        }
    }
}

extension MainViewController:ViewControllerDelegate {
    func selectedIndexPath(indexPath:NSIndexPath) {
        switch indexPath.row {
        case rowHome:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navHomeViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? HomeViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowShare:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navShareViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? ShareViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowUser:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navUserViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? UserViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowLocation:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navLocationViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? LocationViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowClosure:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navClosureViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? ClosureViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowLoadImage:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navLoadImageViewController") as? UINavigationController {
                centerViewController = navigationController
                if let ViewController = navigationController.topViewController as? LoadImageViewController {
                    ViewController.delegate = self
                }
            }
            break
            
        default:
            break
        }
        openCloseMenu()
    }
}

