//
//  ViewController.swift
//  Album
//
//  Created by 김지훈 on 2018. 4. 13..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class Main: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCell
        
        let TitleImageName = Data[indexPath.row]["TitleImage"]

        let TitleImage = UIImage(named: TitleImageName! as! String)
        
        Cell.TitleImageView.image = TitleImage
        Cell.TitleLabel.text = Data[indexPath.row]["TitleLabel"] as? String
        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        UserDefaults.standard.set(SubImg[indexPath.row], forKey: "SubImg")
        UserDefaults.standard.set(SubTitle[indexPath.row], forKey: "SubTitle")
        
        self.performSegue(withIdentifier: "ToDashBoard", sender: self)
    }
    
    // CollectionView_End

}

