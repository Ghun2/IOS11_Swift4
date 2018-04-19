//
//  ViewController.swift
//  DigitalFrame
//
//  Created by 김지훈 on 2018. 4. 18..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Var
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var controllButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    // Var_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myImages = [UIImage(named: "1.jpg")!,
                        UIImage(named: "1-1.jpg")!,
                        UIImage(named: "1-2.jpg")!,
                        UIImage(named: "1-3.jpg")!,
                        UIImage(named: "2.jpg")!,
                        UIImage(named: "2-1.jpg")!,
                        UIImage(named: "2-2.jpg")!,
                        UIImage(named: "2-3.jpg")!,
                        UIImage(named: "3.jpg")!,
                        UIImage(named: "3-1.jpg")!,
                        UIImage(named: "3-2.jpg")!,
                        UIImage(named: "3-3.jpg")!,
                        UIImage(named: "4.jpg")!,
                        UIImage(named: "4-1.jpg")!,
                        UIImage(named: "4-2.jpg")!,
                        UIImage(named: "4-3.jpg")!]
        
        imgView.animationImages = myImages
        imgView.animationDuration = 8
        speedLabel.text = String(format: "%.2f",speedSlider.value)
    }
    
    @IBAction func toggleButton(_ sender:Any) {
        
        if imgView.isAnimating {
            controllButton.setTitle("Start",for: UIControlState.normal)
            imgView.stopAnimating()
        }
        else {
            imgView.animationDuration = Double(speedSlider.value)
            controllButton.setTitle("Stop",for: UIControlState.normal)
            imgView.startAnimating()
        }
    }
    
    @IBAction func speedSliderAction(_ sender:Any) {
        imgView.animationDuration = Double(speedSlider.value)
        controllButton.setTitle("Stop",for: UIControlState.normal)
        imgView.startAnimating()
        speedLabel.text = String(format: "%.2f",speedSlider.value)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

