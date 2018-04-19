//
//  ViewController.swift
//  visualBookManager
//
//  Created by 김지훈 on 2018. 4. 17..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Var
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var countLabel: UILabel!
    
    let myBookManager = BookManager()
    // Var_End
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(name: "햄릿",genre: "비극",author:"셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나",genre: "전쟁소설",author:"헤밍웨이")
        let book3 = Book(name: "죄와벌",genre: "사실주의",author:"톨스토이")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func registerAction(_ sender:Any) {
        var bookTemp = Book()
        
        bookTemp.name = titleTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.genre = genreTextField.text!
        
        myBookManager.registerBook(bookObject: bookTemp)
        
        outputTextView.text = "Register Complete"
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func searchAction(_ sender:Any){
        let resultBook = myBookManager.searchBook(name: titleTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        }
        else {
            outputTextView.text = "We don't have book that you search. ^^;"
        }
    }
    
    @IBAction func removeAction(_ sender:Any) {
        let resultBook = myBookManager.removeBook(name: titleTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
            countLabel.text = "\(myBookManager.countBooks())"
        }
        else {
            outputTextView.text = "Not Found."
        }
    }
    
    @IBAction func showAllBooksAction(_ sender: Any) {
        outputTextView.text = myBookManager.showAllBooks()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

