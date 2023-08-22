//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    var userName = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var rePassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextField.text = ""
        passTextField.text = ""
        rePassTextField.text = ""
        print("viewDidLoad function called")
        // Life Cycle
        
        /**** viewDidLoad */
        /** görünüm yüklendikten sonra */
        
        /**** viewDidDisappear */
        /** view controller kaybolduğunda */
        
        /**** Life Cycle Sıralaması */
        /**
         1. viewDidLoad function called
         2. viewWillAppear function called
         3. viewDidAppear function called
         
         --başka bir ekrana geçtiğimizde
         1. viewWillDisappear function called
         2. viewDidDisappear function called
         
         --geri gittiğimizde
         1. viewWillAppear function called
         2. viewDidAppear function called
         
         !!! buradaki önemli nokta, geri yaptığımızda, viewDidLoad tekrardan çağırılmadı.
        
         */
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
        nameTextField.text = ""
        passTextField.text = ""
        rePassTextField.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }

 /******
  Segue, başka bir ekrana gidebilmemizi sağlar. belirlediğimiz identifier adı ile hangi actionda hangi ekrana gidebileceğimizi tanımlamış oluruz.
  Yeni bir sayfa olarak açılması için main'de view controller'a tıkladığımızda, Editor>Embed in> Navivagiton Controller'ı seçmek gerekir.
  */
    
    @IBAction func nextClicked(_ sender: Any) {
        /*** sender aslında, diğer ekrana gönderilecek olan verileri tutar.*/
        
      //  if (nameTextField.text) != "" { --[Query] Error for queryMetaDataSync: 2
        if let name = nameTextField.text, !name.isEmpty {
            userName = name
            print(name)
            if let pass = passTextField.text, !pass.isEmpty {
                print(pass)
                if let rePass = rePassTextField.text, !rePass.isEmpty {
                    print(rePass)
                    if (pass == rePass){
                        print("passwords are equal")
                        performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }else{
                        showAnAlert(title: "Match Error", message: "Passwords are not matching.")
                    }
                }else{
                    showAnAlert(title: "Re-Password Error", message: "Please enter your password again.")
                }
            }else{
                showAnAlert(title: "Password Error", message: "Please enter a password")
            }
        }else{
            showAnAlert(title: "Username Error", message: "Please enter a username")
        }
    }
    
    func showAnAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Cancel", style: .default) { UIAlertAction in
            // when button clicked
            print("button clicked")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*****
     prepare fonksiyonu, swift ile gelen bir built-in fonksiyondur.
     segue olmadan hemen önceki işlemler burada yazılır.
     hangi identifier ile hangi view controllera gidebiliriz ve gideceğimiz view controllerdaki değerlere böylelikle ulaşabiliriz.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.userName = userName
        }else{
            // kullanıcıya uyarı mesajı gösterme
            let alert = UIAlertController(title: "Error!", message: "An error occurred!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Cancel", style: .default) { UIAlertAction in
                // when button clicked
                print("button clicked")
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

