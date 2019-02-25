//
//  HomePageViewController.swift
//  Practice
//
//  Created by Vuk Radosavljevic on 2/22/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var filterButtons: [FilterButton]!
    
    
    
    // MARK: - Properties
    let signalsDataSource = SignalsDataSource()
    
    var assesments = [Assessment]() {
        didSet {
            print(assesments)
        }
    }
    
    // MARK: - IBActions

    @IBAction func changedFilter(_ sender: FilterButton) {
        filterButtons.setAllToUnselected()
        filterButtons[sender.tag].isSelected = true
    }
    
    
    @IBAction func checkInButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Assessment", bundle: nil)
        guard let initialVc = storyboard.instantiateInitialViewController() as? UINavigationController else {fatalError("Check Assessments storyboard and make sure InitialViewController is A UINavigationController")}
        
        guard let assessmentsVC = initialVc.children.first as? AssessmentsViewController else {fatalError("Check Assessments storyboard and make sure UINavigationController's first child is of type AssessmentsViewController")}
        
        guard assesments.count > 0 else {
            self.presentNoMoreCheckIns()
            return
        }
        
        assessmentsVC.assessments = assesments
        
        self.present(initialVc, animated: true, completion: nil)
    }
    
    // MARK: - View Management
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterButtons[0].isSelected = true
        
        collectionView.dataSource = signalsDataSource
        
        AssessmentClient().getAssessments { (newAssessments, error) in
            guard error == nil else { return }
            self.assesments = newAssessments!
        }
    }

}
