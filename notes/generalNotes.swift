//
//  ViewController.swift
//  firstSwiftExample
//
//  Created by Busra Akcay on 1.07.2023.
//

import UIKit

/*
 * var keyword creates a new variable.
 * let keyword creates a new constant.
 
 ** defining a variable or constant
    let myString : String
 ** initialize a variable or constant by specifing the data type
    let myNumber : Int32 = 50
 
 ** Array
 
 var mixArray = [1,2,"Value",true,false] as [Any]
    * means array includes multiple data types.
    as -> casting, any -> any object
 
 var newVariable = mixArray[2] as! String
    * index 2 is a string (!) means it is for sure.
 
 ** Set
 
 - dizilerden farkı; indexleme yoktur, içerisindeki elemanlar sadece bir defa bulunabilir
 var numberSet : Set = [1,1,1,1,2,3,4,5,6] // an unordered collection of unique elements
 -> {2,1,5,6,4,3} // Sıra yok, sırası karışmış ve her elemandan bir tane var.
 
 var arrayValues = ["..",".."]
 var convertArrayToSet = Set(arrayValues)
 
 var mergingSets = numberSet.union(convertArrayToSet)
 -> union iki seti birleştirir.
 
 ** Dictionary - key-value pairing.
 
 let meyveDizisi = ["Armut","Muz","Elma","Karpuz"]
 let kaloriDizisi = [100,150,120,300]
 
 var meyveKaloriDictionary = ["Armut":100, "Muz":150, "Elma":120, "Karpuz":300]
 meyveKaloriDictionary["Armut"] //100
 meyveKaloriDictionary.keys
 meyveKaloriDictionary.values
 
 meyveKaloriDictionary["Elma"] = 200
 
 ** Loops
 // while loop
 var number = 0
 while number < 10 {
    print(number)
    number += 1
 }
 
 // for loop
 var myFruitArray = ["banane", "apple", "orange"]
 
 for fruit in myFruitArray {
    print(fruit)
 }
 
 var myNumbers=[10,20,30,40,50,60]
 for number in myNumbers {
    print(number / 5)
 }
 
 for myNewArray in 1 ... 5 { // do something } -> [1,2,3,4,5]
 
 // IF Kontrolleri
 
 var myAge = 32
 
 if myAge < 30 {
    print("30 - ")
 }else if myAge > 30 && myAge < 40 {
    print("30s")
 }else{
    print("40 + ")
 }
   
 // FONKSİYONLAR
 
 func myFunction(){
    print("my function")
 }
 
 myFunction() // fonksiyon çağırıldı
 
 func sumFunction(x: Int, y: Int) -> Int { // buradaki ok işareti fonksiyonun geriye bir (int)
    return x + y                           // değer döndüreceğini belirtir.
 }
 
 // OPSİYONELLER
 
 var myName : String?
 myName?.uppercased() // myName initialize edildiyse işlemi yap yoksa yapma geç.
 myName!.uppercased() // bu değer kesinlikle olacak merak etme demek.
 
 myAge = "age" // bizden sayı barındıran bir string bekliyor
 var myInteger = (Int(myAge) ?? 0) * 5
 -- ?? -- anlamı, eğer string değer integer değere  dönüştürülemiyorsa, o zaman bir
 default value ata demek yani bu durumda defaul value 0'dır.
 
 başka bir yolu da - if let - kullanmaktır yani eğer başarabilirsen
 şu, şu işlemleri yap demek gibi bir şeydir.
 
 if let myNumber = Int(myAge) {
    print(myNumber * 5)
 }else{
    print("wrong input")
 }
 
 */

class Notes {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var outletTranslateButton: UIButton!
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }*/
    
    // Translate Hello World! label to Merhaba Dünya and change button title.
    @IBAction func translateButton(_ sender: Any) {
        if(welcomeLabel.text == "Hello World!"){
            welcomeLabel.text = "Merhaba Dünya!"
            outletTranslateButton.setTitle("Translate", for: .normal)
        }else{
            welcomeLabel.text = "Hello World!"
            outletTranslateButton.setTitle("Çevir", for: .normal)
        }
    }
    
}

