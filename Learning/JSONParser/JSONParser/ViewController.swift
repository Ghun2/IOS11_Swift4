//
//  ViewController.swift
//  JSONParser
//
//  Created by 김지훈 on 2018. 5. 3..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

//struct Weather:Decodable {
//    let country:String
//    let weather:String
//    let temperature:String
//}

//struct Wines:Decodable {
//    let _id:String
//    let name:String
//    let year:String
//    let grapes:String
//    let country:String
//    let region:String
//    let description:String
//    let picture:String
//}

struct ActorRecruits:Decodable {
    let title:String
    let making:String
    let name:String
    let director:String
    let part:String
    let preproduction:String
    let castingStar:String
    let period:String
    let pay:String
    let numRecruit:String
    let sexRecruit:String
    let chargeMan:String
    let tel:String
    let mail:String
    let closingDate:String
    let article:String
    let srl:String
    let type:String
    let date:String
    let time:String
    let img:String
}


class ViewController: UIViewController, UITableViewDataSource {
    
    var datalist = [ActorRecruits]()
    
    @IBOutlet weak var mainTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURLstring = "http://52.79.55.164/actorRecruits"
        guard let jsonURL = URL(string: jsonURLstring) else {
            return
        }
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data,response,error) -> Void in
            guard let data = data else{return}
//            print(self.datalist)
            do {
                self.datalist = try JSONDecoder().decode([ActorRecruits].self, from: data)
//                print(self.datalist)
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
//        print(datalist)
        let structTemp = datalist[indexPath.row]

        let curname = structTemp.date

        cell.countryLabel.text = structTemp.title
        cell.weatherLabel.text = curname
        cell.temperatureLabel.text = structTemp.pay
//        cell.imgView.image = UIImage(named: "sunny.png")
        
//        cell.imgView.image = UIImage(named: structTemp.picture)
        
//
//        if curweather == "맑음" {
//            cell.imgView.image = UIImage(named: "sunny.png")
//        }
//        else if curweather == "비" {
//            cell.imgView.image = UIImage(named: "rainy.png")
//        }
//        else if curweather == "흐림" {
//            cell.imgView.image = UIImage(named: "cloudy.png")
//        }
//        else if curweather == "눈" {
//            cell.imgView.image = UIImage(named: "snow.png")
//        }
//        else {
//            cell.imgView.image = UIImage(named: "blizzard.png")
//        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
