//
//  AssessmentClient.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import Foundation

let twoAssessmentURL = URL(string: "https://www.mocky.io/v2/5c7164513500006000e9e829")!
let oneAssessmentURL = URL(string: "https://www.mocky.io/v2/5c7164773500007000e9e82a")!

class AssessmentClient {
    
    func getAssessments(completion: @escaping ([Assessment]?, (Error?)) -> ()) {
        
        let assessments = Resource<[Assessment]>(get: twoAssessmentURL)

        URLSession.shared.load(assessments) { (assessments) in
            
            if let assessments = assessments {
                completion(assessments, nil)
                return
            }
            completion(nil, NSError())
        }
    }
}
