//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 10
        timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunc(){
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate() // stop the timer
            timeLabel.text = "Time's Over"
        }
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
      print("button clicked")
    }
    
    
    
}

