//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

/**
 Jest Algılayıcıları - Gesture Recognizer
 
 kullanıcı bir objeye tıkladı ya da sağa sola çekti, yani kullanıcının dokunma hareketlerini algılama işlemi.
 */

class GestureViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // herhangi bir objeyi tıklanabilir yapma:
        image.isUserInteractionEnabled = true
        
        // gesture recognizer oluşturma:
        // UITapGestureRecognizer -- bir veya birden fazla tıklamayı algılamamızı sağlar.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePicture))
        image.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePicture(){
        if name.text == "Henry Cavill"{
            image.image = UIImage(named: "jensen")
            name.text = "Jensen Ackles"
        }else{
            image.image = UIImage(named: "henry")
            name.text = "Henry Cavill"
        }
   
    }
}

