//
//  DashBoard.swift
//  Album
//
//  Created by 김지훈 on 2018. 4. 13..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class DashBoard: UIViewController, UIPageViewControllerDataSource {
    
    // MARK: Variable
    @IBOutlet weak var PageView: UIView!
    
    var ContentImageData = NSArray()
    var ContentTextData = NSArray()
    // Variable_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Simg = UserDefaults.standard.object(forKey: "SubImg") as! NSArray
        let Stit = UserDefaults.standard.object(forKey: "SubTitle") as! NSArray
        // Data
        ContentImageData = Simg
        ContentTextData = Stit
        
        // Layout
        let InitialView = ContentVCIndex(index: 0) as Content
        let ViewController = NSArray(object: InitialView)
        
        let PageVC = self.storyboard?.instantiateViewController(withIdentifier: "PageVC") as! UIPageViewController
        
        PageVC.view.frame = PageView.bounds
        
        PageView.addSubview(PageVC.view)
        
        addChildViewController(PageVC)
        PageVC.didMove(toParentViewController : self)
        PageVC.dataSource = self
        PageVC.setViewControllers(ViewController as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
    }
    
    
// MARK: Page View
    func ContentVCIndex(index: Int) -> Content {
        
        if ContentTextData.count == 0 || index >= ContentTextData.count {
            return Content()
        }
            
        
        let ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! Content
        
        ContentVC.PageIndex = index
        ContentVC.ContentImage = ContentImageData[index] as! String
        ContentVC.ContentText = ContentTextData[index] as! String

        return ContentVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let ContentVC = viewController as! Content
        var PageIndex = ContentVC.PageIndex as Int
        
        if PageIndex == 0 || PageIndex == NSNotFound {
            return nil
        }
        
        PageIndex -= 1
        
        return ContentVCIndex(index: PageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let ContentVC = viewController as! Content
        var PageIndex = ContentVC.PageIndex as Int
        
        if PageIndex == NSNotFound {
            return nil
        }
        
        PageIndex += 1
        
        if PageIndex == ContentTextData.count {
            return nil
        }
        
        return ContentVCIndex(index: PageIndex)
    }
// Page View_End

    

}
