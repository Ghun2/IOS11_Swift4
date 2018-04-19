//
//  ViewController.swift
//  studyLayout
//
//  Created by 김지훈 on 2018. 4. 12..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstView = UIView();
    let secondView = UIView();
    let thirdView = UIView();
    let fourthView = UIView();
    
    let fivethView = UIView();
    let sixthView = UIView();
    let seventhView = UIView();
    let eighthView = UIView();
    let ninethView = UIView();
    let tenthView = UIView();
    let elevenView = UIView();
    let twelveView = UIView();
    let thirdteenthView = UIView();
    let fourteenthView = UIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(fourthView)
        
        setLayout();
        setDetailLayout();
        
        
    }
    
    func setDetailLayout() -> Void {
        firstView.addSubview(fivethView)
        firstView.addSubview(sixthView)
        
        fivethView.translatesAutoresizingMaskIntoConstraints = false
        fivethView.backgroundColor = UIColor.white
        fivethView.heightAnchor.constraint(equalTo: firstView.heightAnchor).isActive = true
        fivethView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/3).isActive = true
        
        sixthView.translatesAutoresizingMaskIntoConstraints = false
        sixthView.backgroundColor = UIColor.purple
        sixthView.heightAnchor.constraint(equalTo: firstView.heightAnchor).isActive = true
        sixthView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/3).isActive = true
        sixthView.leftAnchor.constraint(equalTo: fivethView.rightAnchor).isActive = true
    }
    
    func setLayout() -> Void {
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = UIColor.black
        firstView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.backgroundColor = UIColor.blue
        secondView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.backgroundColor = UIColor.brown
        thirdView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
        thirdView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
        
        fourthView.translatesAutoresizingMaskIntoConstraints = false
        fourthView.backgroundColor = UIColor.red
        fourthView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.1).isActive = true
        fourthView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        fourthView.topAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

