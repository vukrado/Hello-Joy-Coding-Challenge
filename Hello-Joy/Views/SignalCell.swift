//
//  SignalCell.swift
//  Practice
//
//  Created by Vuk Radosavljevic on 2/23/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

class SignalCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SignalCell"
    
    
    @IBOutlet weak var signalTitleLabel: UILabel!
    @IBOutlet weak var signalDescriptionLabel: UILabel!
    
    @IBOutlet weak var graphView: GraphView!
    
    ///Configures the cell with the given signal
    func configure(with signal: Signal) {
        signalTitleLabel.text = signal.title
        signalDescriptionLabel.text = signal.description
    }
    

}
