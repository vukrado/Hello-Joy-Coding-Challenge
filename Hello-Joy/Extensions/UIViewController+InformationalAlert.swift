//
//  UIViewController+InformationalAlert.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    
    func presentNoMoreCheckIns(title: String? = "Check In Completed!", message: String? = "No more check in's are required for today.", dismissActionCompletion: ((UIAlertAction) -> Void)? = nil, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: dismissActionCompletion)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: completion)
    }
}
