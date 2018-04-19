//
//  Record.swift
//  Memo
//
//  Created by 김지훈 on 2018. 4. 12..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class Record: UIViewController {
    
    // MARK: -Variable
    @IBOutlet weak var RecordTextView: UITextView!
    var MemoData = [String]()
    // Variable_End
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
            RecordTextView.text = ""
        }
        else {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
            
            RecordTextView.text = MemoData[MemoNumber]
        }
        
        
    }
    
    // MARK: -Action
    @IBAction func Save(_ sender: Any) {
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            MemoData.insert(RecordTextView.text, at:0)
            
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }
        else {
            MemoData.remove(at: MemoNumber)
            MemoData.insert(RecordTextView.text, at: MemoNumber)
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }
        
        
    }
    
    
    @IBAction func Delete(_ sender: Any) {
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber != -1 {
            MemoData.remove(at: MemoNumber)
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }
    }
    // Action_End


}
