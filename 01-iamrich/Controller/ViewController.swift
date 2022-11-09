//
//  ViewController.swift
//  01-iamrich
//
//  Created by Manuel Antonio Rojas Barrero on 2/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    //PROPERTIES
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgDiamond: UIImageView!
    
    @IBOutlet weak var btnPush: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hola qué tal")
    }

    //METODOS

    @IBAction func btnPushPressed(_ sender: UIButton) {
//        self.lblTitle.text? = "He pulsado el botón"
//        self.lblTitle.textColor = UIColor.green
//        self.lblTitle.font =  UIFont.systemFont(ofSize: 24)
//
//        self.imgDiamond.image = UIImage(named: "diamond-image")
//        self.btnPush.setTitle("Ya Eres Rico", for: UIControl.State.normal)
        
        //ACTION SHEET (MAS COMÚN EN IPAD)
//        let controller1 = UIAlertController(title: "I am Rich", message: """
//                                           I am Rich,
//                                           I Deserve It,
//                                           I am Good,
//                                           Healthy and Successfull
//                                           """, preferredStyle: .actionSheet)
    
        
        //ALERT (MÁS COMÚN EN IPHONE)
        let controller = UIAlertController(title: "I am Rich", message: """
                                           I am Rich,
                                           I Deserve It,
                                           I am Good,
                                           Healthy and Successfull
                                           """, preferredStyle: .alert)
        
        //ACTIONS - PARA AGREGAR BOTONES
//        let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
//        let actionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//        let actionDestruct = UIAlertAction(title: "Borrar", style: .destructive, handler: nil)
        
        //COMPLETION HANDLERS - CLOSURES
        //3 FORMAS DE ESCRIBIRLA
        //FORMA 1
        let actionOk = UIAlertAction(title: "Aceptar", style: .default) { actionOk in
            print("He pulsado el botón Aceptar")
        }
        
        //FORMA 2
        let actionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: { (actionCancel) in
            print("He pulsado el botón Cancelar")
        })
        
        //FORMA 3
        let actionDestruct = UIAlertAction(title: "Borrar", style: .destructive) { _ in
            print("He pulsado el botón Borrar")
        }
        
        controller.addAction(actionOk)
        controller.addAction(actionCancel)
        controller.addAction(actionDestruct)
        
        self.show(controller, sender: nil)
    }
}

