//
//  ViewController.swift
//  IOSWeatherApp
//
//  Created by Begüm Üner on 23.01.2020.
//  Copyright © 2020 Begüm Üner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var cityName = [String] () // sehir isimleri icin array tanimladik
    var cityImage = [UIImage] ()
    var chosenName = ""
    var chosenImage = UIImage ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //arrayin elemanlarini ekledik
        cityName.append("istanbul")
        cityName.append("berlin")
        cityName.append("paris")
        cityName.append("new york")
        
        cityImage.append(UIImage( named: "istanbul")!)
        cityImage.append(UIImage( named: "berlin")!)
        cityImage.append(UIImage( named: "paris")!)
        cityImage.append(UIImage( named: "new york")!)
        
        
    }
    
    //cellfor yazinca gelen fonksiyonda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() // cell objesi olusturduk
        cell.textLabel?.text = cityName[indexPath.row] // o obje ile rowlara isimleri yazdirdik
        return cell // her zaman cell doner
    }
    
    // numberof yazinca gelen fonksiyon
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityName.count // kac satir olacagini doner
    }

    //didselect yazinca gelen fonksiyon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //secilen satirdan sonra ne olacagini gosteriyor
        
            chosenImage = cityImage[indexPath.row]
            chosenName = cityName[indexPath.row]
            performSegue(withIdentifier: "weatherController", sender: nil) // segue ile obur sayfaya gonderdim
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "weatherController"
        {
            let destinationVC = segue.destination as! weatherController
            destinationVC.chosenImage =  chosenImage
            destinationVC.chosenCity = chosenName
        }
    }
    
   

}

