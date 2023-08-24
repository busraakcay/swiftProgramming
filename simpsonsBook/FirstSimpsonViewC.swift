//
//  ViewController.swift
//  swiftProgramming
//
//  Created by Busra Akcay on 29.07.2023.
//

import UIKit

class SimpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var simpsonsArray = [Simpsons]()
    var chosenSimpson : Simpsons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        let bart = Simpsons(name: "Bart", job: "Student", image: UIImage(named: "bart")!)
        let homer = Simpsons(name: "Homer", job: "Worker", image: UIImage(named: "homer")!)
        let lisa = Simpsons(name: "Lisa", job: "Student", image: UIImage(named: "lisa")!)
        let maggie = Simpsons(name: "Maggie", job: "Baby", image: UIImage(named: "maggie")!)
        let marge = Simpsons(name: "Merge", job: "House Wife", image: UIImage(named: "marge")!)
        
        simpsonsArray.append(bart)
        simpsonsArray.append(homer)
        simpsonsArray.append(lisa)
        simpsonsArray.append(maggie)
        simpsonsArray.append(marge)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = simpsonsArray[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonsArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destination = segue.destination as! DetailsVC
            destination.selectedSimpson = chosenSimpson
        }
    }

}

