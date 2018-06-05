//
//  RecruitCell.swift
//  ThatActor
//
//  Created by 김지훈 on 2018. 5. 24..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class RecruitCell: UITableViewCell {

    //_Val
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    
    //Val_End
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
