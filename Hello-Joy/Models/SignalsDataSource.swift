//
//  SignalsDataSource.swift
//  Hello-Joy
//
//  Created by Vuk Radosavljevic on 2/24/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

/// Data source for signals home page
class SignalsDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private Properties
    
    ///List of signals being trackekd
    private (set) var signals = [Signal(title: "Symptoms", description: "Track symptom severity and distribution over time to learn about potential indicators."),
                                 Signal(title: "Mood", description: "See how your positivity and energy levels are trending over time."),
                                 Signal(title: "Location & Mobility" , description: "Research indicates that increased movement and mobility is correlated with reduced depression."),
                                 Signal(title: "Physical Activity", description: "Research indicates that increased physical activity is correlated with reduced depression.")]
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return signals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: SignalCell.reuseIdentifier , for: indexPath) as? SignalCell else {
                fatalError("Expected `\(SignalCell.self)` type for reuseIdentifier \(SignalCell.reuseIdentifier). Check the configuration in Main.storyboard.")
        }
        
        let signal = signals[indexPath.item]
        
        cell.configure(with: signal)
        return cell
    }

    

}
