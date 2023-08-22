//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

/**
 UITableViewDelegate, UITableViewDataSource -> view controllerimizda tableView özelliklerine erişmek için eklenir.
 */
class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    var landmarksNames = [String]()
    var landmarksImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // tableView için de belirtmek gerekiyor
        tableView.delegate = self
        tableView.dataSource = self
        
       
        landmarksNames.append("Colosseum")
        landmarksNames.append("Great Wall")
        landmarksNames.append("Kremlin")
        landmarksNames.append("Stonehenge")
        landmarksNames.append("Taj Mahal")
        
      
        landmarksImages.append(UIImage(named: "colosseum")!)
        landmarksImages.append(UIImage(named: "greatwall")!)
        landmarksImages.append(UIImage(named: "kremlin")!)
        landmarksImages.append(UIImage(named: "stonehenge")!)
        landmarksImages.append(UIImage(named: "tajmahal")!)
        
    }

    /**
        tableView protokollerini eklediğimizde, Type 'ViewController' does not conform to protocol 'UITableViewDataSource' hatası alırız.
        bu hatanın giderilmesi için belirli fonksiyonlar eklememiz gerekir.
     */
    
    // kaç tane girdi olacak? kaç tane row?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarksNames.count
    }
    
    // ne gösterilecek? table cell içerisinde ne gösterilecek?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // hücre oluşturma -- öncelikle hücre oluşturmak gerekiyor.
        let cell = UITableViewCell()
        
        // eski yöntem ile yeni bir cell oluşturma:
        // cell.textLabel?.text = "test"
        
        // yeni yöntem
        var content =  cell.defaultContentConfiguration()
        content.text = landmarksNames[indexPath.row]
        //content.image = landmarksImages[indexPath.row]
        //content.secondaryText = "test"
        cell.contentConfiguration = content
        return cell
    }
    
    //tableView de bir row seçildiğinde
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarksNames[indexPath.row]
        chosenLandmarkImage = landmarksImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarksNames.remove(at: indexPath.row)
            self.landmarksImages.remove(at: indexPath.row)
            // bu durumda veriler, arrayden silindi fakat hala table'da mevcut,
            // istersek table view'e reload yapabiliriz
            // tableView.reloadData() // ama bu durumda tüm table'ı baştan tekrar yükler ve verimsiz olabilir.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
}

