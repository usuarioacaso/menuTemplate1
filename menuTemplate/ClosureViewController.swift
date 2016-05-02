//
//  ClosureViewController.swift
//  menuTemplate
//
//  Created by Adrian Camacho Soriano on 26/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol ClosureViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class ClosureViewController: UIViewController {
    
     weak var delegate:ClosureViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //ejemploClosure{ //llamada abreviada del closue
        //}
        
//        ejemploClosure(complete:{ [unowned self]()->() in // ojo con el unowned
//            print("en el closure")
//            })
        
        ejemploClosure(complete:{ ()->() in
            print("en el closure")
        })
        
        ejemploClosureConParametro(closure: { (codigo)->() in
            print("usando el codigo en el closure con parametro: \(codigo)")
        })
        
        ejemploClosureConRetorno(closure: { (codigo)->Int in
            let newCode = codigo + 3
            return newCode
        })
    }
    
    private func ejemploClosure(complete complete:()->()) {
        print("antes del closure")
        complete()
        print("luego del closure")
    }
    
    private func ejemploClosureConParametro(closure closure:(codigo:Int)->()){
        //obtenemos el codigo
        let codigo = 10
        closure(codigo: codigo)
        //seguir ejecutando codigo
    }
    
    private func ejemploClosureConRetorno(closure closure:(codigo:Int)->Int){
        //obtengo el codigo
        let codigo = 10
        let nuevoCodigo = closure(codigo: codigo)
        print("mi nuevo codigo con retorno: \(nuevoCodigo)")
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }

}
