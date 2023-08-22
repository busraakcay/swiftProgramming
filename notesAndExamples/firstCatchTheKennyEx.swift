//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

class MyFirstCatchKennyViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscore: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    var gameTimer = Timer()
    var hideTimer = Timer()
    var totalHighscore = 0
    var counter = 0
    var score = 0
    
    var kennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func startGame(){
        counter = 10
    
        timer.text = String(counter)
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
    
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(catchKenny))
            
            kenny1.addGestureRecognizer(recognizer1)
            kenny2.addGestureRecognizer(recognizer2)
            kenny3.addGestureRecognizer(recognizer3)
            kenny4.addGestureRecognizer(recognizer4)
            kenny5.addGestureRecognizer(recognizer5)
            kenny6.addGestureRecognizer(recognizer6)
            kenny7.addGestureRecognizer(recognizer7)
            kenny8.addGestureRecognizer(recognizer8)
            kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        let gameHighscore = UserDefaults.standard.object(forKey: "highscore")
        if let userHighscore = gameHighscore as? Int {
            highscore.text = "Highscore: \(userHighscore)"
            totalHighscore = userHighscore
        }
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
               
        hideKenny()
    }
    
    @objc func catchKenny(){
        score += 1
        totalHighscore += 1
        scoreLabel.text = "Score: \(score)"
        highscore.text = "Highscore: \(totalHighscore)"
        UserDefaults.standard.set(totalHighscore, forKey: "highscore")
    }
    
    @objc func timerFunc(){
        timer.text = String(counter)
        counter -= 1
        
        if counter < 0 {
            gameTimer.invalidate() // stop the timer
            showAlert(title: "Game is over", message: "Do you want to play again?")
        }
    }
    
    @objc func hideKenny() {
        
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
        
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            self.score = 0
            self.scoreLabel.text = "Score: \(self.score)"
            self.startGame()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetHighscore(_ sender: Any) {
        
        let highscore = UserDefaults.standard.object(forKey: "highscore")
        if (highscore as? Int) != nil {
            UserDefaults.standard.removeObject(forKey: "highscore")
            self.highscore.text = "Highscore: 0"
            scoreLabel.text = "Score: 0"
        }
        
    }
    

}

