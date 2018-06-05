//
//  ViewController.swift
//  ThatActor
//
//  Created by 김지훈 on 2018. 5. 24..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

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

    
    //_Val
    var datalist = [ActorRecruits]()
    var currentPage = 1
//    var refresher: UIRefreshControl!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var pageNumLabel: UILabel!
    
    //Val_End
    
    //_Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(page:currentPage)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecruitCell
        
        let structTemp = datalist[indexPath.row]
        
        cell.titleLabel.text = structTemp.title
        cell.typeLabel.text = structTemp.type
        cell.payLabel.text = structTemp.pay
        cell.dateLabel.text = structTemp.date
        cell.sexLabel.text = structTemp.sexRecruit
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMainDetail" {
            (segue.destination as! DetailMainCell).detailDic = [datalist[mainTableView.indexPathForSelectedRow!.row]]
        }
    }
    
    func getData(page:Int){
        
        let jsonURLstring = "http://52.79.55.164/actorRecruits/" + String(page)
        guard let jsonURL = URL(string: jsonURLstring) else {
            return
        }
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data,response,error) -> Void in
            guard let data = data else{return}
            do {
                self.datalist = try JSONDecoder().decode([ActorRecruits].self, from: data)
                DispatchQueue.main.async(execute: {
                    self.mainTableView.reloadData()
//                    self.refresher.endRefreshing()
                })
            }catch {
                print("Parsing Error \(error)")
            }
            
        }).resume()
    }
    
    @IBAction func pageDownButton(_ sender: Any) {
        if currentPage > 1 {
            currentPage -= 1
            getData(page: currentPage)
            pageNumLabel.text = String(currentPage)
        }
    }
    @IBAction func pageUpButton(_ sender: Any) {
        currentPage += 1
        pageNumLabel.text = String(currentPage)
//        datalist = [ActorRecruits]()
        getData(page: currentPage)
//        self.mainTableView.reloadData()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Func_End

}

