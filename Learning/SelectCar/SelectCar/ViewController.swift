//
//  ViewController.swift
//  SelectCar
//
//  Created by 김지훈 on 2018. 4. 24..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    // MARK: Val
    @IBOutlet weak var imgView: UIImageView!
    
    let carCompanyName = ["Lamborghini","Porsche","Ferrari"]
    var carModel = [String]()
    
    let lam = ["Aventador","Centenario","Madman"]
    let por = ["porsche1","porsche2","porsche3"]
    let fer = ["Ferrari1","Ferrari2","Ferrari3"]
    
    // Val_End

    override func viewDidLoad() {
        super.viewDidLoad()
        carModel = lam
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
    }
    
    // MARK: Func
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return carCompanyName.count
        }
        else {
            return carModel.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        }
        else {
            return carModel[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            carModel = lam
        }
        else if component == 0 && row == 1 {
            carModel = por
        }
        else if component == 0 && row == 2 {
            carModel = fer
        }
        pickerView.reloadAllComponents()
        let imgString:String = "\(carModel[pickerView.selectedRow(inComponent: 1)]).jpg"
        imgView.image = UIImage(named: imgString)
    }
    
    // Func_End

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

