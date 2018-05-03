//
//  ViewController.swift
//  JSONParser
//
//  Created by 김지훈 on 2018. 5. 3..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

struct Weather:Decodable {
    let country:String
    let weather:String
    let temperature:String
}

class ViewController: UIViewController, UITableViewDataSource {
    
    var datalist = [Weather]()
    
    @IBOutlet weak var mainTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURLstring = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.json"
        guard let jsonURL = URL(string: jsonURLstring) else {
            return
        }
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data,response,error) -> Void in
            guard let data = data else{return}
            print(self.datalist)
            do {
                self.datalist = try JSONDecoder().decode([Weather].self, from: data)
                print(self.datalist)
                DispatchQueue.main.async(execute: {
                    self.mainTabelView.reloadData()
                })
            }catch {
                print("Parsing Error \(error)")
            }
            
        }).resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        let structTemp = datalist[indexPath.row]
        
        let curweather = structTemp.weather
        
        cell.countryLabel.text = structTemp.country
        cell.weatherLabel.text = curweather
        cell.temperatureLabel.text = structTemp.temperature
        
        if curweather == "맑음" {
            cell.imgView.image = UIImage(named: "sunny.png")
        }
        else if curweather == "비" {
            cell.imgView.image = UIImage(named: "rainy.png")
        }
        else if curweather == "흐림" {
            cell.imgView.image = UIImage(named: "cloudy.png")
        }
        else if curweather == "눈" {
            cell.imgView.image = UIImage(named: "snow.png")
        }
        else {
            cell.imgView.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
