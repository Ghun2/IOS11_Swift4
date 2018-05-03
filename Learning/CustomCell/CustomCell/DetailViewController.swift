//
//  DetailViewController.swift
//  CustomCell
//
//  Created by 김지훈 on 2018. 4. 26..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detaildata = [String:String]()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = detaildata["name"]
        amountLabel.text = detaildata["amount"]
        valueLabel.text = detaildata["value"]
        imgView.image = UIImage(named: detaildata["image"]!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
