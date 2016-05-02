//
//  DescargaImagenViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 27/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
// ojo para renombrar el archivo image.jpg tomar nota de la direccion donde esta y "mv image.jpg imagex.jpg" en el terminal

import UIKit
import MBProgressHUD

class DescargaImagenViewController: UIViewController {

    @IBOutlet weak var imagenPrincipal: UIImageView!
    
    private var pathImage:String? {
        let pathDocument = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        return pathDocument?.stringByAppendingString("/image.jpg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://www.4flip.com/audi-fulldh.jpg"
        // validams si existe el archivo
        if let path = pathImage {
            let fileManager = NSFileManager()
            if fileManager.fileExistsAtPath(path) {
                imagenPrincipal.image = UIImage(contentsOfFile: path)
                print("direccion del archivo image.jpg: \(path)")
            }else{
                MBProgressHUD.showHUDAddedTo(self.navigationController?.view, animated: true)
                downloadImage(fromUrlString: urlString, downloadComplete: { [weak self] (image)->() in
                    self?.imagenPrincipal.image = image
                    MBProgressHUD.hideAllHUDsForView(self?.navigationController?.view, animated: true)
                })
            }
        }else{
            MBProgressHUD.showHUDAddedTo(self.navigationController?.view, animated: true)
            downloadImage(fromUrlString: urlString, downloadComplete: { [weak self] (image)->() in
                self?.imagenPrincipal.image = image
                MBProgressHUD.hideAllHUDsForView(self?.navigationController?.view, animated: true)
            })
        }
    }
    
    private func downloadImage(fromUrlString urlString:String, downloadComplete:(image:UIImage?) ->()) {
        NSOperationQueue().addOperationWithBlock({[weak self] () ->() in
            var image:UIImage?
            if let url = NSURL(string: urlString) {
                if let data = NSData(contentsOfURL: url) {
                    //guarda la imagen
                    if let path = self?.pathImage {
                        do {
                            try data.writeToFile(path, options: [])
                        }catch{
                            
                        }
                    }
                    image = UIImage(data: data)
                }
            }
            NSOperationQueue.mainQueue().addOperationWithBlock({
                downloadComplete(image: image)
            })
        })
    }
}
