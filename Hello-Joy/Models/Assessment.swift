//
//  Assessment.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import Foundation

///Standardized Clinical Assessment
struct Assessment: Decodable {
    
    ///id of the assessment
    let id: String
    ///Name of the assessment
    let name: String
    ///Display name of the assessment
    let displayName: String
    ///Disorder the assessment is testing for
    let disorder: String
    ///Total possible score for the assessment
    let totalScore: Int
    let cadenceUnit: String
    let cadenceValue: Int
    let isPerUnit: Bool
    ///Title for the assessment questions
    let title: String?
    ///List of possible answers for this assessment
    let answers: [Answer]
    ///Used to score the answers
    let mapping: [Mapping]
    let questions: [Question]
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, disorder, title, answers, mapping, questions
        case displayName = "display_name"
        case totalScore = "total_score"
        case cadenceUnit = "cadence_unit"
        case cadenceValue = "cadence_value"
        case isPerUnit = "is_per_unit"
    }
    
    ///Returns the count of questions
    func totalQuestions() -> Int {
        return questions.count
    }
}

///A possible answer for an assessment question
struct Answer: Decodable {
    ///Title of the possible answer
    let title: String
    ///Value the answer holds, used when scoring the assessments
    let value: Int
    
}

struct Mapping: Decodable {
    let max: Int
    let min: Int
    let title: String
}

///A question for an assessment
struct Question: Decodable {
    ///What the question is testing for
    let key: String
    ///Title of the question
    let title: String
}



