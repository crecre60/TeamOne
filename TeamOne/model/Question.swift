//
//  Question.swift
//  TeamOne
//
//  Created by Young Ju on 3/17/22.
//

import Foundation

class Question
{

    var question: String = ""
    var firstAnswer: String = ""
    var secondAnswer: String = ""
    var thirdAnswer: String = ""
    var fourthAnswer: String = ""
    var correctAnswer: Int = 0
    var wrongAnswer: Int = 0
    var isAnswered: Bool = false

    init(question: String,  firstAnswer: String,  secondAnswer: String,  thirdAnswer: String,  fourthAnswer: String, correctAnswer: Int, wrongAnswer: Int, isAnswered: Bool)
    {
        self.question = question
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.thirdAnswer = thirdAnswer
        self.fourthAnswer = fourthAnswer
        self.correctAnswer = correctAnswer
        self.wrongAnswer = wrongAnswer
        self.isAnswered = isAnswered
    }
}
