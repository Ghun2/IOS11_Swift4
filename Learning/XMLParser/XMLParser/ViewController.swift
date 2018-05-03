//
//  ViewController.swift
//  XMLParser
//
//  Created by 김지훈 on 2018. 5. 2..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {

    var datalist = [[String:String]]()
    var detaildata = [String:String]()
    var black:Bool = false
    
    var elementTemp:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        
        guard let baseURL = URL(string: urlString) else {
            print("URL Error")
            return
        }
        
        guard let parser = XMLParser(contentsOf: baseURL) else {
            print("Can't read data")
            return
        }
        
        parser.delegate = self
        if !parser.parse() {
            print("Parse failure")
        }
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        black = true
        print(elementName)
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if black == true && elementTemp != "local" && elementTemp != "weatherinfo" {
            detaildata[elementTemp] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        print(string)
        print(detaildata)
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            datalist.append(detaildata)
        }
        black = false
        print(elementName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        var dicTemp = datalist[indexPath.row]
        
        let curweather = dicTemp["weather"]
        
        cell.countryLabel.text = dicTemp["country"]
        cell.weatherLabel.text = curweather
        cell.temperatureLabel.text = dicTemp["temperature"]
        
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

