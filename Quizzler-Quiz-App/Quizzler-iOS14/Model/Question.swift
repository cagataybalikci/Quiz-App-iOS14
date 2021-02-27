//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Çağatay Balıkçı on 6.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : [String]
    let correctAnswer : String
    
    init(q: String, a: [String],correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
