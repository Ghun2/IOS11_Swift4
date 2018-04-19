//
//  ViewController.swift
//  Memo
//
//  Created by 김지훈 on 2018. 4. 12..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class Main: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var MemoData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        return MemoData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell",for: indexPath) as! MainCell
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        Cell.TitleLabel.text = MemoData[indexPath.row]
        
        return Cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MemoNumber = indexPath.row
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        self.performSegue(withIdentifier: "ToRecord", sender: self)
    }
    // Table_End
    
    // MARK: Action
    @IBAction func Add(_ sender: Any) {
        
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
        
    }
    // Action_End
}

