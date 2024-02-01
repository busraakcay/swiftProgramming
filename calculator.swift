//
//  ViewController.swift
//  calculator
//
//  Created by Busra Akcay on 19.07.2023.
//

import UIKit

class Calculator {
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }*/
    
    @IBAction func sum(_ sender: Any) {
        let firstValue = Int(firstNum.text!)!
        let secondValue = Int(secondNum.text!)!
        //integer oluşturup tekrar ! koymaktansa, sonuna ! eklenilir.
        //mantıklı... ilki text fielddan gelmesi gereken optional,
        //ikinci de kesin integer olacak opsiyoneli...
        let sum = firstValue + secondValue
        result.text = String(sum)
    }
    
    @IBAction func sub(_ sender: Any) {
        let firstValue = Int(firstNum.text!)//!
        let secondValue = Int(secondNum.text!)//!
        let sub = Int(firstValue!) - Int(secondValue!)
        result.text = String(sub)
    }
    @IBAction func mult(_ sender: Any) {
        if let firstValue = Int(firstNum.text!){
            if let secondValue = Int(secondNum.text!){
                let mult = firstValue * secondValue
                result.text = String(mult)
            }
        }
    }
    @IBAction func div(_ sender: Any) {
        let firstValue = Int(firstNum.text!)
        let secondValue = Int(secondNum.text!)
        let div = Int(firstValue!) / Int(secondValue!)
        result.text = String(div)
    }
}

