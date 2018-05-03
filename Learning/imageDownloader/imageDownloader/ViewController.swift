//
//  ViewController.swift
//  imageDownloader
//
//  Created by 김지훈 on 2018. 5. 2..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var downloadTask:URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: Any) {
        imgView.image = nil
        indicatorView.startAnimating()
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
    
        downloadTask = session.downloadTask(with: URL(string: "https://avatars1.githubusercontent.com/u/26113409?s=460&v=4")!)
//        downloadTask = session.downloadTask(with: URL(string: "https://avatars1.githubusercontent.com/u/26113409?s=460&v=4")!, completionHandler: {(data,response,error) -> Void in
//            let dataTemp:Data = try! Data(contentsOf: data!)
//            self.imgView.image = UIImage(data: dataTemp)
//            self.indicatorView.stopAnimating()
//        })
        downloadTask.resume()
    }
    @IBAction func suspendAction(_ sender: Any) {
        downloadTask.suspend()
    }
    @IBAction func resumeAction(_ sender: Any) {
        downloadTask.resume()
    }
    @IBAction func cancelAction(_ sender: Any) {
        downloadTask.cancel()
        progressView.setProgress(0.0, animated: false)
        indicatorView.stopAnimating()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let value:Float = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        progressView.setProgress(value, animated: true)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let dataTemp:Data = try! Data(contentsOf: location)
        imgView.image = UIImage(data: dataTemp)
        indicatorView.stopAnimating()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

