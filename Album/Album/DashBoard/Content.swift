//
//  Content.swift
//  Album
//
//  Created by 김지훈 on 2018. 4. 13..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class Content: UIViewController {
// MARK: Variable
    @IBOutlet weak var ContentImageView: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    
    var PageIndex = Int()
    var ContentImage = String()
    var ContentText = String()
// Variable_End
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContentImageView.image = UIImage(named: ContentImage)
        ContentLabel.text = ContentText
    }

}
