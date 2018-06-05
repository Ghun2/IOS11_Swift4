//
//  DetailMainCell.swift
//  ThatActor
//
//  Created by 김지훈 on 2018. 5. 31..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class DetailMainCell: UIViewController {

    //_Var
    var detailDic = [ActorRecruits]()
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var datetimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var makingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var preproductionLabel: UILabel!
    @IBOutlet weak var castingStarLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var numsexRecruitLabel: UILabel!
    @IBOutlet weak var chargeManLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var closingDateLabel: UILabel!
    @IBOutlet weak var articleLabel: UITextView!
    
    //Var_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dict = detailDic[0]
        
        typeLabel.text = dict.type
        datetimeLabel.text = dict.date + " " + dict.time
        titleLabel.text = dict.title
        makingLabel.text = dict.making
        nameLabel.text = dict.name
        directorLabel.text = dict.director
        partLabel.text = dict.part
        preproductionLabel.text = dict.preproduction
        castingStarLabel.text = dict.castingStar
        periodLabel.text = dict.period
        payLabel.text = dict.pay
        numsexRecruitLabel.text = dict.numRecruit + " / " + dict.sexRecruit
        chargeManLabel.text = dict.chargeMan
        telLabel.text = dict.tel
        mailLabel.text = dict.mail
        closingDateLabel.text = dict.closingDate
        articleLabel.text = dict.article
        
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
