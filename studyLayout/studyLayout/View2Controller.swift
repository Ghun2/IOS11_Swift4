//
//  View2Controller.swift
//  studyLayout
//
//  Created by 김지훈 on 2018. 4. 12..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class View2Controller: UIViewController {
    let view_1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view_1)
        view_1.translatesAutoresizingMaskIntoConstraints = false
        view_1.backgroundColor = UIColor.red
        view_1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view_1.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
