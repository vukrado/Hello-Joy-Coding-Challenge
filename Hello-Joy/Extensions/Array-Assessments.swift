//
//  Array-Assessments.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import Foundation

extension Array where Element == Assessment {
    
    ///Returns the sum of questions for each assessment
    func getTotalQuestions() -> Int {
        
        var totalQuestions = 0
        
        for assessment in self {
            totalQuestions += assessment.totalQuestions()
        }
        return totalQuestions
    }
    
    ///Returns the all of the questions for the assessments combined
    func allQuestions() -> [Question] {
        var allQuestions = [Question]()
        
        for assessment in self {
            allQuestions.append(contentsOf: assessment.questions)
        }
        return allQuestions
    }
    
    ///Returns a dictionary that has keys for the starting and ending question for each assessment, the value of the keys are the assesments display name
    func assessmentInfo() -> [Int: String] {
        
        var assessmentInfo = [Int: String]()
        var totalQuestions = 0
        
        if self.count == 0 { return assessmentInfo }
        
        for index in 0..<self.count {
            assessmentInfo[totalQuestions] = self[index].displayName
            totalQuestions += self[index].totalQuestions()
            assessmentInfo[totalQuestions - 1] = self[index].displayName
        }
        
        return assessmentInfo
    }
}
