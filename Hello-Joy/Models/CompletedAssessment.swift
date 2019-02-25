//
//  CompletedAssessment.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import Foundation

///Completed Assessments used to POST to database when user is finished.
struct CompletedAssessments: Encodable {
    
    ///List of complete assessments
    let assessments: [CompleteAssessment]
}

///A single complete assessment
struct CompleteAssessment: Encodable {
    ///Unique identifier of the assessment completed
    let id: String
    
    ///List of completed Answers for the given assessment
    let answers: [CompletedAnswer]
    
    ///Creates a new unique identifier on initialization
    init(id: String = UUID().uuidString, answers: [CompletedAnswer]) {
        self.id = id
        self.answers = answers
    }
    
    
}

///A completed answer for an assessment
struct CompletedAnswer: Encodable {
    ///Value of the answer to the given question
    let value: Int
    ///The key for the given question
    let key: String
}


///Appends a new answer if the question hasn't been answered, else it overrides the answer for the question.
extension Array where Element == CompletedAnswer {
    mutating func add(_ answer: CompletedAnswer, for currentQuestion: Int) {
        if self.count > currentQuestion {
            self[currentQuestion] = answer
        } else {
            self.append(answer)
        }
    }
}
