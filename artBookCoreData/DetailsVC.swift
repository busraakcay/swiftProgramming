//
//  DetailsVC.swift
//  ArtBookCoreData
//
//  Created by Busra Akcay on 24.08.2023.
//

import UIKit
import CoreData // core data özelliklerini kullanabilmek için eklemek gerekir.
/**
 Image picker'ı kullaabilmek için gerekli olan UIImagePickerControllerDelegate ve UINavigationControllerDelegate
 protokollerini eklemek gerekiyor;
 ImagePicker - galeriyi açtırabilmek için,
 NavigationController ise galeriye gidip gelme süreçlerini yapabilmemiz için gerekli olan bir protokol
 **/
class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            //saveButton.isEnabled = false // tıklanamaz hale getirir
            saveButton.isHidden = true
            // let pId = chosenPaintingId!.uuidString - UUID'yi string'e çevir
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = chosenPaintingId?.uuidString
            //Koşul yazmak için kullanılır
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
               
                if results.count > 0 {
                    print("ok")
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        if let image = result.value(forKey: "image") as? Data {
                            imageView.image = UIImage(data: image)
                        }
                    }
                }
            }catch{
                print("error")
            }
        }else{
            saveButton.isHidden = false
            saveButton.isEnabled = false
            print("empty")
        }

        //Recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTabGestureRec = UITapGestureRecognizer(target: self, action: #selector(onClickImage))
        imageView.addGestureRecognizer(imageTabGestureRec)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onClickImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }

    
    @IBAction func saveButtonClicked(_ sender: Any) {
        /**
         core datayı kullanabilmek için öncelikle, app delegate dosyasına ulaşmalıyız
        
         */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // context içine ne koyacağımızı belirticez
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // bu adımdan sonra artık kayıt işlemlerini gerçekleştirebiliriz.
        
        // Attributes
      
        newPainting.setValue(UUID(), forKey: "id")
        newPainting.setValue(nameText.text, forKey: "name")
        newPainting.setValue(artistText.text, forKey: "artist")
        
        if let year = Int(yearText.text!){
            newPainting.setValue(year, forKey: "year")
        }
        
        let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
            print("succes")
        }catch{
            print("error")
        }
        
        /**
         NotificationCenter - diğer view controllerlara mesaj yollamamızı sağlar
         */
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
