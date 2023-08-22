//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

class StoringAndDeletingUserDefaultData {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
     func viewDidLoad__() {
        //super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting as? vs. as!->force casting
        
        if let userName = storedName as? String {
            nameField.text = userName
            nameLabel.text = "Name: \(userName)"
        }
        
        if let userBirthday = storedBirthday as? String{
            birthdayField.text = userBirthday
            birthdayLabel.text = "Birthday: \(userBirthday)"
        }
        
    }

    @IBAction func saveUserInfos(_ sender: Any) {
        
        // hafızada veri kaydetme - UserDefaults
        // kullanıcının default veritabanı - key-value değerler kaydedilebilir.
        UserDefaults.standard.set(nameField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayField.text!, forKey: "birthday")
        // UserDefaults.standard.synchronize() -> artık bu kısmı kullanmaya gerek kalmadı.
        
        let nameText = "Name: \(nameField.text!)" // bu ifade, string ifade içerisinde bir değişken kullanılacağını belirtir.
        let birthdayText = "Birthday: \(birthdayField.text!)"
        
        
        nameLabel.text = nameText
        birthdayLabel.text = birthdayText
    }
    
    @IBAction func deleteUserInfos(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
       /** if let deleteName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        
        if let deleteBirthday = storedBirthday as? String {
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
        **/
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameField.text = ""
            nameLabel.text = "Name:"
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayField.text = ""
            birthdayLabel.text = "Birthday:"
        }
       
        
    }
    
    
}

