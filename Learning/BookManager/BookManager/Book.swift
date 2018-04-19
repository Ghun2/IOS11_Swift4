//
//  Book.swift
//  BookManager
//
//  Created by 김지훈 on 2018. 4. 17..
//  Copyright © 2018년 Ghun2. All rights reserved.
//

struct Book {
    var name:String
    var genre:String
    var author:String
    
    func bookPrint() {
        print("Name : \(name)")
        print("Genre : \(genre)")
        print("Author : \(author)")
        print("--------------------")
    }
}
