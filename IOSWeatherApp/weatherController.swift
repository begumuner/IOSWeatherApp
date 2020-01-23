//
//  weatherController.swift
//  IOSWeatherApp
//
//  Created by Begüm Üner on 23.01.2020.
//  Copyright © 2020 Begüm Üner. All rights reserved.
//

import UIKit

class weatherController: UIViewController {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var tempature: UILabel!
    @IBOutlet weak var imageCont: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var chosenImage: UIImage?
    var chosenCity: String = "istanbul"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCont.image = chosenImage

      // urlimizi olusturuyoruz
               //let url = URL(string: "http://api.weatherstack.com/current?%20access_key=1ee0d1873ee57769f63b745708664ea3&query=istanbul")
                guard let url = URL.init(string: "http://api.weatherstack.com/current?%20access_key=1ee0d1873ee57769f63b745708664ea3&query=\(chosenCity)") else { return }
               
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   //hata varsa onu yazdir
                   if error != nil {
                       print(error!.localizedDescription)
                   }else {
                       
                       if data != nil {
                           do {
                               let jsonresponse = try JSONSerialization.jsonObject(with:data!, options: .mutableContainers) as! [String : Any]
                               
                               DispatchQueue.main.async {
                                  
                                   if let json2 = jsonresponse["location"] as? [String : Any]{
                                       if let local = json2["country"] as? String
                                       {
                                           self.time.text = "COUNTRY : \(local)"
                                       }
                                   }
                                   
                                   if let json1 = jsonresponse["current"] as? [String : Any] {
                                      
                                       if let tempature = json1["temperature"] as? Int
                                       {
                                           self.tempature.text = "TEMPERATURE : \(tempature)"
                                       }
                                       
                                       if let windSpeed = json1["wind_speed"] as? Int
                                       {
                                           self.wind.text = "WINDSPEED : \(windSpeed)"
                                       }
                                   }
                                   
                                   if let json = jsonresponse["request"] as? [String : Any] {
                                       if let city = json["query"] as? String
                                       {
                                           self.name.text = "CITY : \(city)"
                                       }
                                   }
                                   
                               }
                               
                           }catch{
                               print(error.localizedDescription)
                           }
                       }
                   }
               }.resume()
         
    }
}
