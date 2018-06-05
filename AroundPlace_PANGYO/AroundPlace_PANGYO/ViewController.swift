//
//  ViewController.swift
//  AroundPlace_PANGYO
//
//  Created by 김지훈 on 2018. 5. 4..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var contestlist = [[String:String]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let dict = ["title":"G-Start A","sub":"예비/초기 스타트업을 위한 4주 인큐베이팅 코스","img":"exam01.png"]
        let dict2 = ["title":"2018 공공데이터 및 빅데이터 활용 창업경진대회",
                    "sub":"농식품 분야 공공 및 민간 빅데이터를 활용한 제품·서비스 개발 및 융·복합 분석으로 창업을 촉진하고 일자리 창출에 기여","img":"exam02.jpg"]
        
        contestlist = [dict,dict2]
    }

    // MARK: function
    // MARK: tableView init
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contestlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        
        var contestCelltemp = contestlist[indexPath.row]
        
        cell.titleLabel.text = contestCelltemp["title"]
        cell.subtitleLabel.text = contestCelltemp["sub"]
        cell.imgView.image = UIImage(named: contestCelltemp["img"]!)
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

