//
//  ViewController.swift
//  02-dices
//
//  Created by Manuel Antonio Rojas Barrero on 13/11/22.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    @IBOutlet weak var imgDice1: UIImageView!
    @IBOutlet weak var imgDice2: UIImageView!
    @IBOutlet weak var lblSumaDices: UILabel!
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    let diceImages : [String]
    
    let nFaces : UInt32
    
    //PARA INICIALIZAR CUALQUIER VARIABLE NO ASIGNADA O INICIALIZADA
    required init?(coder: NSCoder) {
        diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        nFaces = UInt32(diceImages.count)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //METHODS
    @IBAction func btnThrowDices(_ sender: UIButton) {
        generarRandomDices()
    }
    
    func generarRandomDices(){
 
        randomDiceIndex1 = Int(arc4random_uniform(nFaces))
        randomDiceIndex2 = Int(arc4random_uniform(nFaces))

        let imageDice1 = diceImages[randomDiceIndex1]
        let imageDice2 = diceImages[randomDiceIndex2]

        //print(imageDice1)
        //print(imageDice2)
        
        //Otra opción
        //imgDice1.image = UIImage(named: generarImagenAleatoria())
        //imgDice2.image = UIImage(named: generarImagenAleatoria())
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut) {
            
            //PARA ANIMACIÓN INDEPENDIENTE
//            self.imgDice1.transform = CGAffineTransform(translationX: 0, y: 100)
//            self.imgDice1.transform = CGAffineTransform(rotationAngle: .pi)
//            self.imgDice1.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            
            //PARA ANIMACIÓN CONCATENADA
            //DADO 1
//            self.imgDice1.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: 3)).concatenating(CGAffineTransform(translationX: -100, y: 100))
//
//            //DADO 2
//            self.imgDice2.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: 3)).concatenating(CGAffineTransform(translationX: 100, y: 100))

            self.imgDice1.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: .pi))
            self.imgDice2.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: .pi))
            
            //EL ORDEN COMÚN PARA LAS TRANSFORMACIONES ES:
            //1.ESCALADO
            //2.ROTACIÓN
            //3.TRASLACIÓN
            
            //PARA OCULTAR IMAGEN:
            self.imgDice1.alpha = 0.0
            self.imgDice2.alpha = 0.0
            
        } completion: { (completed) in
            
            //PARA REINICIAR EL TAMAÑO DE LAS IMAGENES
            self.imgDice1.transform = CGAffineTransform.identity
            self.imgDice2.transform = CGAffineTransform.identity
            
            //PARA VOLVER A MOSTRAR LA IMAGEN:
            self.imgDice1.alpha = 1.0
            self.imgDice2.alpha = 1.0
            
            //PARA ASIGNAR NUEVA IMAGEN
            self.imgDice1.image = UIImage(named: imageDice1)
            self.imgDice2.image = UIImage(named: imageDice2)
            self.lblSumaDices.text = String(self.randomDiceIndex1 + self.randomDiceIndex2 + 2)
            
            
            //VALIDAR SI SE SACAN PARES
            if self.randomDiceIndex1 == self.randomDiceIndex2 {
                
                let controller = UIAlertController(title: "Felicitaciones!!", message: "Sacaste Pares", preferredStyle: .actionSheet)
                let actionAceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                          
                controller.addAction(actionAceptar)
                
                self.show(controller, sender: nil)
            }
        }
    }
    
    //PARA UTILIZAR EL SHAKE DEL CELULAR
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generarRandomDices()
        }
    }
    
    
    //Otra opción con método independiente
//    func generarImagenAleatoria() -> String {
//
//        let randomDiceIndex : Int = Int(arc4random_uniform(nFaces))
//        let nombreImagen : String = diceImages[randomDiceIndex]
//
//        return nombreImagen
//    }
}

