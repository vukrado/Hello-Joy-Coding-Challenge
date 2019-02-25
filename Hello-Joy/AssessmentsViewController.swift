//
//  AssessmentsViewController.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

class AssessmentsViewController: UIViewController {
    
    
    // MARK: - Properties
    ///List of assessments
    var assessments: [Assessment]!
    
    ///List of all questions for the assessments
    private var allQuestions = [Question]()
    
    ///Holds information on when each assessment begins and ends
    private var assessmentInfo = [Int: String]()
    
    ///The current question number, starting at zero.
    private var currentQuestion = 0
    {
        didSet {
            if currentQuestion == 0 {
                let dismissButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissView))
                dismissButton.tintColor = .mainPurple
                navigationItem.leftBarButtonItem = dismissButton
            } else {
                setBackButton()
            }
        }
    }
    ///The total amount of questions for all assessments combined
    private var totalQuestions: Int = 0
    
    ///Holds the completed answers for all assignments combined
    private var completedAnswers = [CompletedAnswer]()
    
    // MARK: - ViewManagement
    override func viewDidLoad() {
        super.viewDidLoad()
        assessmentInfo = assessments.assessmentInfo()
        currentQuestion = 0
        totalQuestions = assessments.getTotalQuestions()
        allQuestions = assessments.allQuestions()
        setupAnswerButtons()
        updateViews()
    }
    
    ///Sets the left bar button to a back arrow when the current question is greater than zero
    private func setBackButton() {
        let customButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        customButton.setImage(MyAppImages.backButton.image, for: .normal)
        customButton.addTarget(self, action: #selector(goToPreviousQuestion), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: customButton)
    }
    
    ///Updates the views
    private func updateViews() {
        
        assessmentTitleLabel.text = assessments?.first?.title
        
        
        if let _ = assessmentInfo[currentQuestion] {
            assessmentDisplayName.text = assessmentInfo[currentQuestion]
        }
        
        assessmentQuestionProgressLabel.text = "\(currentQuestion + 1) out of \(totalQuestions)"
        assessmentProgress.progress = Float((Float(currentQuestion) / Float(totalQuestions)))
        
        UIView.transition(with: questionTitleLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.questionTitleLabel.text = self.allQuestions[self.currentQuestion].title
        }, completion: nil)
        
    }
    
    // MARK: - IBOutlets
    
    ///Progress bar for question progress
    @IBOutlet weak var assessmentProgress: UIProgressView!
    
    ///Display name of the current assessment.
    @IBOutlet weak var assessmentDisplayName: UILabel!
    
    ///Label for question progress
    @IBOutlet weak var assessmentQuestionProgressLabel: UILabel!
    
    ///Assessments title.
    @IBOutlet weak var assessmentTitleLabel: UILabel!
    
    ///The title of the question being asked.
    @IBOutlet weak var questionTitleLabel: UILabel!
    
    ///List of answer options.
    @IBOutlet var answerOptionButtons: [AnswerButton]!
    

    // MARK: - IBActions
    @IBAction func questionAnswered(_ sender: AnswerButton) {
        
        let key = allQuestions[currentQuestion].key

        let value = sender.tag
        let answer = CompletedAnswer(value: value, key: key)
        
        completedAnswers.add(answer, for: currentQuestion)
        answerOptionButtons.setAllToUnselected()
        goToNextQuestion()
    }
    
    // MARK: - Private Methods
    
    ///Initial setup of answer buttons
    private func setupAnswerButtons() {
        
        guard let assessment = assessments.first else {
            self.presentNoMoreCheckIns() { self.dismissView() }
            return
        }
        
        for answer in assessment.answers {
            answerOptionButtons[answer.value].setTitle(answer.title, for: .normal)
        }
    }
    
    ///Goes to the next question
    private func goToNextQuestion() {
        
        if totalQuestions == (currentQuestion + 1) {
            print("Complete")
            assessmentCompleted()
            dismissView()
            
        } else {
            currentQuestion += 1
            
            if completedAnswers.indices.contains(currentQuestion) {
                answerOptionButtons.setAllToUnselected()
                let value = completedAnswers[currentQuestion].value
                answerOptionButtons[value].isSelected = true
            }
            updateViews()
        }
    }
    
    ///Example Post Request
    private func assessmentCompleted() {
        
        var completedAssessments = [CompleteAssessment]()
        
        let indicies = assessmentInfo.keys.sorted()
    
        for index in stride(from: 0, to: indicies.count, by: 2) {
            let answersForAssessment = Array(completedAnswers[indicies[index]...indicies[index+1]])
            for answer in answersForAssessment {
                print("Key = \(answer.key)")
                print("Value = \(answer.value)")
            }
            print(" ")
            let completeAssessment = CompleteAssessment(answers: answersForAssessment)
            completedAssessments.append(completeAssessment)
        }
        
        print(completedAssessments)

    }



    ///Goes to the previous question
    @objc private func goToPreviousQuestion() {
        currentQuestion -= 1
        updateViews()
        answerOptionButtons.setAllToUnselected()
        
        if completedAnswers.count > currentQuestion {
            let value = completedAnswers[currentQuestion].value
            answerOptionButtons[value].isSelected = true
        }
    }
    
    ///Dismisses the view
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}



